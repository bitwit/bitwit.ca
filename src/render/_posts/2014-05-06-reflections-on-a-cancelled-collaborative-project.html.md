---
author: kylnew
comments: true
date: 2014-05-06 22:52:52+00:00
excerpt: This past April I cancelled a collaborative project I had been working on with another developer since last November. I wanted to write a little bit about the project and what happened that led to this decision in an effort to continuously improve what I do. This is my post-mortem.
layout: post
slug: reflections-on-a-cancelled-collaborative-project
title: Reflections on a Cancelled Collaborative Project
wordpress_id: 1650
categories:
- Blog
tags:
- collaboration
- developer life
- discussion
- idevblogaday
- post-mortem
---

This past April I cancelled a collaborative project I had been working on since last November. It was a very difficult decision to make and took a lot of consideration but I feel it was the right decision. It isn't my intention to be the good or bad guy, I just want to write a little bit about what happened that led to this decision in an effort to continuously improve what I do. This is my post-mortem.


### The New Project Specifications


In November of 2013, a friend of mine introduced me to another developer. This developer (who I will refer to as the CEO), had a pre-existing service for web that she wanted to make into an iPhone app. Coincidentally, I had recently realigned my career goals to work more collaboratively with others. So I was quite enthusiastic about taking an opportunity to work with another developer.

Over a couple of talks in restaurants and coffee shops we came to an agreement about how the project would move forward. I would develop the iPhone application and the CEO would own it 100%. I would get a 35% cut of all advertising and subscription revenue made from the iPhone app. The app's data service(API) would be provided to me and was already in working order since it was used in the web version. I would help with some design and architecture aspects but final design was to be provided to me by the CEO's previous designer.


### Beginning the project


After coming to an agreement, I was ready to go. The following week I committed all my work hours toward making our first prototype and uncovering any issues/needs. It was a very productive first week. I worked on the app for about 50% of the next week, mostly diving deeper into making the app more performant. The week after (now early December) we met and discussed exactly the changes she needed to make to the data API in order to facilitate the iPhone app.


### Middle of the project


This is about the point things started to derail. I'm not sure if it was the nature of December and the holidays or what, but the changes I had requested weren't made. In about the second week of January, I decided to switch focus back to my recently released app, [Postcard](http://www.postcardsocial.net). We always had an understanding that I was working on 2 iOS Applications but I did consider hers to be like client work and therefore my first priority. However, the data API hadn't changed yet and I didn't want to sit on my hands indefinitely, so I switched my focus. On reflection, I should have been more proactive about making sure the data API was being developed for me rather than waiting. Thinking of her as a client, I just let it take as long as necessary. Paying clients, however, are motivated by the cost of development; partners are not.

Postcard's development moved forward at a great rate. By the end of January I had shipped it off to Apple for approval. So with my own app in the approval queue at Apple, I was available to return my focus. When I emailed the CEO again about our project and the data API's status, I was met with a response to the tune of "I'm ready, I was just on hold while you worked on Postcard". I wasn't a big fan of this response. For one thing, the timing of events was out of order for that to be a viable reason. I had only come back to Postcard after not seeing much momentum on my other project. We met up for lunch the following week and I discussed some concerns regarding our pace, the level at which we were communicating and other matters. We came to an agreement that we had lacked enough communication with either other and made too many assumptions. We both agreed to improve.

I also brought up the state of design and when this would fit into the project. I wanted final design sooner rather than later so I volunteered to make a thorough information architecture document outlining the views and interactions. This way she could hand the document to the designer earlier and we could have that discussion sooner. Interface before implementation.

I had a goal for our first user testing build to be ready by March 16th. While this build didn't end up constituting a 'beta', it was a significant move forward, implementing everything I had outlined in the architecture. Unfortunately, the data API changes that I requested hadn't all been made yet, so there was no way to have a beta build ready anyway.


### End of the project


On March 16th, after delivering the latest build, I informed the CEO I wouldn't be able to work on it again until start of April. Postcard, which I had released on February 19th, needed some attention now that it was out in stores. In early April we started up again. We had a lunch to discuss next steps and agreed to meet at a collaborative workspace I frequent to hammer out the data API. I inquired about the status of design as well, but was informed the designer still had not yet been contacted after I delivered information architecture.

We met that weekend, hammered on code all day and developed all the changes to the data API, except for one. Things were finally looking good for the data service portion. At the conclusion of our day together, I informed the CEO that we needed that last API fix and to bring the designer on to this ASAP.

That Monday I was informed "we have a problem...". The designer was uninterested in working on the project. Judging by the tone of the email it actually sounded like he had been unavailable/uninterested for a little while. I was incredibly frustrated by this, after having stressed the importance of the design aspect for months. Over a series of a few more emails, I quit the project.


### The reasons that I quit the project


That's the whole story in a nutshell. It was a very difficult decision to make. After being informed that the designer was out, it took me a day or two to reply just because I needed to carefully consider the situation and how I wanted to move forward. From that I concluded the following:



	
  * I was running out of time and money. I hadn't taken a contract in over 6 months and was only doing enough freelance to get by as I tried to developed apps I had some ownership of. I hadn't anticipated the project would go on like this. I didn't feel like the right developer for the project. I assessed too much risk in continuing.

	
  * The CEO should have been more motivated to complete the tasks I requested of her; both data and design. We could have identified the designer issue in late February/early March. She shouldn't have forwarded me an email to inform me 'we have a problem'. She could have been proactively seeking another designer and reassuring me this was only a temporary setback. That was the kind of leadership I needed to see from her in the moment of crisis.

	
  * As a result of this, I didn't feel I was being adequately supported on the project and set up for success. You need to feel like your business partners have your back and your work together has a synergistic result. I did not feel we were achieving this.




### The mistakes I made


If I tried to end this post without criticizing what I did wrong I would be thoroughly kidding myself. So what mistakes did I make?



	
  * I should have proactively communicated better when I wasn't getting what I wanted. I didn't want to patronize a developer for whom I have much respect, but things might have happened sooner if I was just a bit more assertive.

	
  * I should have set more clear timeline and/or project benchmarks for us to meet.

	
  * I should have outlined more clauses in our agreement regarding the expected timely fulfilling of requests.

	
  * I should have ignored Postcard completely until the completion of this project. If some of the previous 'should-have's were fulfilled, this would have been accomplished naturally. The divided focus, particularly toward the end, was hurting me.

	
  * _Maybe_ I should have made my concerns throughout the project more clear. This is a really hard one to say though from a relationship management POV. You don't won't come off as the person who's being too anal about how a project has to go.




### In conclusion


If I could do it again, I would, but with the aforementioned adjustments. I liked the project. I like and respect the CEO. If this project were adopted by a new developer they would be getting a significant leg up on the starting code, app design and data API. While the end of our collaboration together is over, all is certainly not.

I would gladly collaborate again. The results of collaboration are amazing and it is the kind of thing you just have to continuously try to improve upon. These lessons learned don't expose our personal flaws so much as the kinds of issues that are innate in collaborative projects. They would have inevitably happened on one project or another eventually so I'm glad to be ready for them sooner rather than later. I hope that we're both walking away as better developers than we were before. I know I am.



_Think there's something I missed in this post-mortem? Leave a comment._
