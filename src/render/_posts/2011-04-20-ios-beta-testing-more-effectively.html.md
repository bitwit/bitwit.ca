---
author: kylnew
comments: true
date: 2011-04-20 20:55:35+00:00
layout: post
slug: ios-beta-testing-more-effectively
title: iOS Beta Testing More Effectively
wordpress_id: 309
categories:
- Blog
tags:
- testing
- UX
---

It's been 3 weeks since my last post and I'm aching to post something new.  This might also be my last chance before I get much busier this month with new work and the side development of my 2 games so I'm forcing myself to get one more out before the work pile gets any thicker.

<!-- more -->

I've stressed in the past the importance of user testing to get the most polish out of your product but I want to talk a bit more about some ideas for how to get the most out of those experiences, particularly when it comes to long distance testing (as opposed to watching over someone's shoulder).  If you have ever had a testing phase for an iOS application, you know what a hassle it can be to get good testers.  I define a good tester as someone who installs your product and proactively gives you feedback on the experience.  Maybe I should actually call these people 'Gem Testers' because they are an incredible asset to development.  So what can we do to get the most out of our testing phase and yield better feedback?  There are 2 keys things I want to talk about:



	
  1. 


## TestFlight




	
  2. 


## Analytics (such as Flurry, Localytics etc...)







## TestFlight
[http://www.testflightapp.com](http://testflightapp.com/)




[![](http://kylnew.com/wp-content/uploads/2011/04/Screen-shot-2011-04-20-at-4.29.17-PM-300x42.png)](http://kylnew.com/wp-content/uploads/2011/04/Screen-shot-2011-04-20-at-4.29.17-PM.png)



When I started using TestFlight as a tester for someone else's application, I was blown away by the simplicity compared to what I had been doing in the past.  Let's review **the old system**; I'll highlight the steps I hate most in red.



	
  1. Beg for testers

	
  2. Assemble list of volunteers and ask for their device UDIDs

	
  3. Manually input device UDIDs into Apple interface

	
  4. Acquire provisioning profile and associate with Application

	
  5. Create AdHoc testing build

	
  6. Send testers an App and a Provisioning Profile and ask them to install it themselves next time they plug their device in

	
  7. Sit and wait and wonder if they tried it




Let's review the **TestFlight** process now.  I'll highlight the steps that give me a tear of joy in green



	
  1. Beg for testers - Direct them to a small sign up form

	
  2. TestFlight registers the user for testing with me and retrieves the UDID once they install Test Flight on their phone

	
  3. Users who already have TestFlight registered for a device can skip step 2

	
  4. Use TestFlight to export a list of all the UDIDs and import that list into the Apple Interface

	
  5. Acquire provisioning profile and associate with Application

	
  6. Create AdHoc testing build

	
  7. Upload build to TestFlight and assign testers to the build.

	
  8. All testers are notified and can download the app straight to their device in one easy step

	
  9. TestFlight delivers immediate feedback on who has installed your app.

	
  10. Testers can leave feedback through the TestFlight system which is logged for your review


If it isn't already clear what a difference it can make to the level of organization you have in your testing distributions, let's also think about the tester for a moment.  The tester is doing you a huge favour already by volunteering their personal time to help you, shouldn't you be trying to make their experience as easy and smooth as possible?  I'm convinced that asking people to download and manually install the app is a MASSIVE barrier to getting people to test your application.


## Analytics


[![](http://kylnew.com/wp-content/uploads/2011/04/Screen-shot-2011-04-20-at-4.27.03-PM-300x189.png)](http://kylnew.com/wp-content/uploads/2011/04/Screen-shot-2011-04-20-at-4.27.03-PM.png)

While TestFlight helps take care of a smoother sign up to testing process, it doesn't give you much insight on what happens after the app is downloaded.  This is only where you get the privilege of stopping with your 'Gem Testers' because they will be actively consulting with you.  The remaining 85% of your tester base are going to need some poking and prodding at for feedback and even at that, some may just not get back to you.  Also, what about all those people who will be using your app after launch and never say a thing; Wouldn't it be great to yield some feedback from them too?

The good news is you can get 100% return rate on things you choose to programatically track using tools like [Flurry](http://www.flurry.com/) or [Localytics](http://www.localytics.com/) or [Mixpanel](http://mixpanel.com/) (or all of the above).  I personally only have experience with Flurry so I will only speak to some of its features which I have leveraged.  Here are some of the **questions analytics can answer for you**:



	
  * How many unique users do I have?

	
  * How many am I retaining?

	
  * How long are people using the app for?

	
  * What device types are being used?

	
  * What exceptions are being thrown that crash my app?

	
  * What are the results of my app's [INSERT EVENT HERE] ?

	
  * What kind of path are users taking through my app?


Consider this to be the short list of questions you can have answered for you **every single time the app is used. **By far, one of the most useful things I have tracked is a custom event that tells me the Final Score, Stage, Multiplier, Games Played and Total Points Earned of every game played.  Through this I have seen some surprising patterns emerge.  I've also been able to measure the learning curve as people play games and I see their best scores slowly improve.  This is a tremendous learning experience and I see very clearly now a path for improvement thanks to the feedback of all my 'Gem Testers' and the statistics I have tracked.

I often get this feeling that there is a stigma against deep analytics - that it is an invasion of personal privacy.  That's is only remotely true at best, when you are tracking deeply personal information and/or sharing it with third parties.  The reality is, you are doing this for yourself to develop a better product.  Good and relevant products are developed by deeply researching and understanding your market, not by blindly releasing software.


### Closing Thoughts


With all these things considered, I still urge you to spend a good amount of time on over the shoulder testing.  There is absolutely no substitute for watching someone use your application right in front of you.  Learning things like where users tap, how frequently they tap, what they are thinking at any given moment and so forth is not going to be learned by any other means.  Thoroughly understanding the first 1 to 2 minutes of user engagement with your app can be the Holy Grail of answers as to why people are or aren't using it as intended.  Some of these things are the most critical to getting absolute polish on an application.
