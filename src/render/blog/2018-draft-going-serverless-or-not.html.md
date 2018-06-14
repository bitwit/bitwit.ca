---
layout: post
comments: true
date: 2018-06-01 14:00:00+00:00
author: Kyle Newsome
tags:
  - post
  - software
  - server-side
title: Serverless or Not? That is the question
description:
status: draft
excerpt:
disqusId: serverless-or-not
---

This post is an anecdote about my adventures in learning about cloud functions. Over the last few days I've been back and forth on the pros/cons of these services and think my experiences might exemplify what others have/will go through when weighing the benefits themselves. This is about a hobby project I am working on, which is a great place to try new things and make mistakes. The lesson's learned and challenges faced may not be as relevant to enterprises; you be the judge.

## New Day, New Hobby

After attending AltConf in San Jose last week, I came up with the overly ambitious idea of making a directory website for Swift Package Manager libraries in one day over the weekend.
If that wasn't enough, I decided that I wanted to pay as little as possible every month if the website gets no traffic. To make it even more difficult and go against my general rule of "Learn Something or Ship Something - pick one", I thought that IBM Cloud's Serverless solution might fit my criteria to try using Swift code in my backend solution.

Serverless, for the uninitiated, is IBM's cloud functions service. I believe AWS calls them lambda functions. The general idea is that instead of running entire servers in the cloud, you execute isolated blocks of code on demand and pay only for the exact amount of compute time you are using. No need to pay for all that idle server time. No need to load balance or scale. No health checking and self healing. In principle, it sounds like a cheap way to realiably do work in the cloud and pay per use down to the millisecond.

## Concept

I decided to *creatively* name my project the Swift Package Directory. Visitors can search for swift packages or add ones of their own by providing the github repository name. For v1 of the website, that's about it.

There were 3 main functions for this application.
1. The search function that returns relevant packages from the database
2. The add function that puts content in the database
3. A long running function that updates all packages in the database. This one is doesn't need to face externally and could run on a schedule.

### The Database
My first thought was to use an open source github repository as my database. I could use the pull request system let people post their packages. The repository could also be updated with other repository information regularly, such as a popular repositories json file generated daily. This didn't solve for problem **1.**; I still would need a mechanism for searching and updating that search index. 

IBM Cloud offers a free tier of their Cloudant NoSQL databases too, which I ultimately decided would suit my needs well enough. It's limited on write/reads per second though so I was going to need a way around that.

### The Website
If I could set these three functions up in the cloud with a connected database solution, then all I would need is a static HTML website. Netlify offers a free tier for static website, so I decided that's where it would live

### The cache
In order to avoid hitting my limits too quickly on Serverless or Cloudant, I expected that I would need to put a caching layer over top of this whole operation. Given this search directory does not need realtime updates to any of the responses, I would just put the whole sit behind a CDN that clears regularly and call it a day. Cloudflare also offers a free tier with SSL support, so that way the plan. Caching and domain name management, however, became the crux of the problem, as I will discuss futher.

## Execution

You can [follow along with the code I wrote here]()

### Getting running

Getting set up with Serverless and Swift was not a trivial task. IBM's Serverless is built using [OpenWhisk][1], which has it's own special way of executing Swift code. I learned quickly that in order to have my code run correctly I needed to make sure it was built with an [OpenWhisk Docker container][2] that contains the methods needed to wrap your Swift code before deploying (See that repo's **epilogue.swift** &amp; **spm-build/_Whisk.swift** if you want to know what gets added to your code). Some headaches ensued in learning this but on the other side it worked. My `deploy.sh` file was derived from IBM's documentation on how to use this Docker container as a convenient build tool.

### Sharing function code

After writing out my functions it became abundantly clear there was a lot of duplicate code in each. I certainly didn't want to suddenly have a maintenance nightmare out of three functions. That would seem like a serious step backward from writing normal server-side code. I would pay money **NOT** to have to do maintenance like that.
Not to fret, however, Serverless Swift let's you include all the packages you want. The real challenge becomes managing a folder structure. I ended up with a `SPDCore` Package at my root and my "actions" (i.e. serverless functions) in a `actions/functionName` structure. Unfortunately for Swift development package dependencies require a tagged git commit. This meant I had to commit and tag and bump version in my actions' `Package.swift` files every time I wanted my actions to build with the latest code. I hope that in a future version of Swift Package Manager that this requirement is dropped for locally sourced dependencies.

### Testing locally

One thing I like about taking the Serverless approach was that each of my functions was an executable I could test individually in XCode. It was just nice to not have HTTP in the way; just inputs and outputs. Running in XCode did require me to add a little bit of MacOS only code to my `Main.swift` to execute the function outside of OpenWhisk, but it was very.

### Testing remotely

The local and remote experiences were mostly identical. I needed to input some environment variables from their management console instead of in my XCode scheme but that was about it. Testing the functions, the first response after idle time was usually a little bit cold, taking between 500ms-1000ms but things were more responsive between 50ms-100ms thereafter. Cloud functions may not be ideal for things that should be super fast and are prone to testing a user's patience. With CDN caching in place I wasn't too worried about my function's average response times being slow. 

### Going Live

Finally, I put together a static HTML site to access these serverless functions. I pushed some code to Netlify and was up and running in no time. The only thing left to bring it all together now was getting everything behind a CDN and running on HTTPS. I wanted to uses my custom domain name so I had some DNS configuration to figure out and that's when things went a little south...

## First major roadblock - IBM Account upgrade

In order to access DNS services with IBM, you need to put in a credit card. I put my information in and was denied for security reasons. After contacting customer service by phone I was asked to try again. On my second and third attempt I was denied again. IBM's security layer requires a 1 hour waiting period between each attempt so this was starting to test my patience. Exchanges continued by email, phone and Twitter over 30 hours before I was finally granted access. 

In that waiting period of limited access, I grew a bit frustrated with having to wait. Afterall, I had just poured hours into trying out this new service IBM wants us to try only to be denied what I need to finish my assessment. I started to feel foolish for taking a direction with my code that might make me too beholden to one service provider, which seemed crazy. 

Is serverless really a good idea if its less transferable than a docker container? What was I losing by not taking a more traditional approach to backend? I was determined not to let myself be beholden to IBM.

## Pivot - Wrapping the code in a Swift server

Armed with the conservative assumption that IBM might never give me the access I need, I devised a plan to serve what I had made so far while trying to make the least change possible to my serverless code. 
I decided to use Vapor, a server-side Swift framework. Using docker I set my project up in a container. Thanks to my separating most of the core serverless code into it's own module, my Vapor server could simply import this existing module as-is. I wrapped the logic in a few HTTP routes and it was ready to go. Better yet, Vapor was able to serve the static files itself rather than needing to worry about serving my static assets elsewhere.
I stuck with using IBM's Cloudant for the database, as my free tier IBM account was still operational and, like I said, the goal was to not touch code I had already written.

Next, I was faced with the challenge of how to deploy this code. Given that I was going to need a server running 24/7 at this point, my ambitions of a near-$0/month bill would have to be set aside, at least temporarily. I care enough about the site I'm trying to build not to let implementation/cost details keep it out of production forever.

### Deploying Manually

My first though was to try deploying the code to a cloud provider manually. I went with DigitalOcean because I knew they offer droplets for $5/month, which I can deal with. After launching an instance, I tunneled in via SSH, pulled down my git code and got it running pretty quickly.
The problem with this approach, however, was all the manual work I immediately started dreading as I went through the motions.

- How am I going to deploy changes for this and then restart the server?
- How do I set up the right port access?
- How will I maximize uptime and restart if it goes down?
- How will I set up HTTPS?

All these issues and more were suddenly my burden. It was faster to set up initially, but I was unsettled about the increased responsibility. Operations related issues like these are my least favorite of software engineering problems, especially when I'm not being paid to solve them like on hobby projects.

### Deploying through Heroku

I had never tried Heroku this week but I had heard great things about the simplicity of their interface and the peace of mind it brings. So I tried packaging my site up in a docker container and deploying the code. This process was quite straight forward, as I had hoped and gave me all the peace of mind my DigitalOcean approach lacked. However, there were a couple of noteworthy issues:

- With Heroku I had to deploy the whole Docker container. This was initially 2GB of transfer and my changes, which affected the whole `.build` folder meant ~400MB uploads on every new deploy. I tried cutting the size down by having the project build on launch but it was too slow to start within the 60s Heroku provides.

## Back to Serverless

After passing time fiddling with 2 alternate solutions for a day, IBM got in touch with me and helped resolve my issues. 



## Pros & Cons

Serverless Pros
- No scaling, load balancing, self healing needed
- Minimalistic approach to getting work done in the cloud
- No containerization, large deployment artifacts

Serverless Cons
- Tricky to develop offline
- Many manual tasks for things you'd do in code
  - API Endpoint setup
- Once multiple functions want to share code or environment variables, it gets more complicated/arduous

Several days later this has become my adventure to try serving swift code, for less than $10/month.

[1](https://openwhsk.apache.org/)
[2](https://github.com/apache/incubator-openwhisk-runtime-swift/tree/master/core/swift41Action)