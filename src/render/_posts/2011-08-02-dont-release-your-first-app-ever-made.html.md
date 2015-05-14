---
author: kylnew
comments: true
date: 2011-08-02 12:45:52+00:00
layout: post
slug: dont-release-your-first-app-ever-made
title: Don't release your first app ever made
wordpress_id: 437
categories:
- Blog
tags:
- idevblogaday
- pixel fighters
---

## Update 08/03/2011


Given the response I've received today on this post, I feel inclined to explain my position.  I think the title of the post may have been an over reach since the message was intended to be about **planning and drafting** your work as opposed to putting the brakes on any of your hard efforts.  If you interpret this message as some sort of emergency stop or disincentive from taking a project all the way - you are mistaken - I could never suggest that especially if you read my last post.  However, if it is early stages and you are brand new, I do encourage considering it a draft and starting again with what you have learned so far.  You will appreciate the improved quality and maintain-ability. THIS ALONE is what I mean by not releasing your first app.  My apologies to those misled or upset by any other interpretation which I did not intend.  Cheers ~ K

--------------

Prior to releasing my first app ever made on iOS, there was one salient piece of advice I consciously ignored:


### DON'T release your first app ever made


At the time, it may not have been crystal clear why people say this; but hindsight has a way of beating you over the head about it later.  I think there are a few crucial reasons why one should follow this advice:



	
  * You have no point of comparison.  There's no prior piece of work of yours to reference, it's all just coming together for the first time.  **Your first project is like a canvas for your collective dump of ideas and borrowed code.**

	
  * There's a good chance that early on you will make an assumption or write a fundamental piece of imperfect code that shapes some form of your app.  That piece of code will be a mistake too deeply engrained to remove or change without a greater overhaul.

	
  * The first time you try something, it will almost certainly not be your best work.  If you do a great job the first time, you'll do even better on the second run.

	
  * **Maintaining/supporting your first piece of work could become more effort than you realize.**  If you know your code is working but is also a bit quirky, it's probably going to be a bugger (no pun intended) to maintain or improve.




## [![](http://kylnew.com/wp-content/uploads/2011/07/picard-facepalm-300x240.jpg)](http://kylnew.com/wp-content/uploads/2011/07/picard-facepalm.jpg)




### Reflecting on mistakes


It is important to reflect on our code's faults and imperfections in order to improve as much as possible in the future, so there were a few personal mistakes that I wanted to share related to the themes above. Most of these example relate to game development, but several relate to apps in general.


#### No Manager Object




For one thing, I feel my code lacked a solid core.  I think one of the fundamental things it missing was a good manager object, in charge of holding the game together.  Something in charge of  keeping references to everything important and frequently requested, in charge of loading most of the game and getting things started.




A useful concept that helps me is thinking of your app like a real business, where your code objects are your employees.  You wouldn't have employees doing redundant tasks beside one another, you wouldn't send them on wild goose chases around the office to find something, nor would you make every individual employee do everything for themselves immediately after they started working for your company.  You would want to run a lean, cost efficient business.  The same is inherently true for app development and the approach that needs to be taken.  When I started Pixel Fighters, I had a LOT of redundant code and repetitive objects, and nothing in charge of keeping the app together, much like a Manager would assist and oversee their employees in getting the job done.




#### Lazy loading, scattered loading, unnecessary reloading




Since I lacked a good manager, I was missing a good place to deal with loading and unloading game assets.  The iPhone gives you an incredibly tight amount of free memory for your game to work with, so every piece used counts.  When something isn't needed, it must be removed in order to leave memory room for the next guy. Also, while it is nice to delay loading until something is absolutely necessary, don't choose that option if it means your app freezing momentarily at an inconvenient time on the user.




If you don't have a **memory usage plan** - that is, a strategy in place for loading and unloading the assets you need - it's going to be a big pain trying to work one in later after your app starts getting memory warnings or acting choppy.




Some of us are lucky enough to have apps that don't need the whole limit, so releasing things from memory isn't an issue.  That's still a memory plan in my books.  It's a plan to keep things tight and within the provided limits - I tip my hat to the developers that manage.




#### Not enough property lists




What is fundamentally wrong with this piece of code? :



    
    if( stage == 7 )



    
    {



    
      // do something magical here



    
    }


The problem here is that you are hard coding a special condition for a particular situation.  It is far too specific a piece of code to have lying in your game logic. Let's suppose for a moment that you wanted to amend this piece of code so that it works on Stage 3 and Stage 10 also, except on Stage 10 it needs to do one thing less than on Stage 3 and 7.  If you are thinking in code right now about the nested conditions you might start writing to do this, you know it could get messy fast.

So let's try this another way instead.  Let's assume that EVERY stage is capable of doing ALL these things, and instead you simply enable or disable some of these conditions based on a loaded-in property list that contains the specific conditions for each stage's possible properties.  I will talk a bit more about this in my next post.


#### No strong object hierarchies or highly reusable elements




Learning to program in an object oriented fashion is one thing; learning to do it well is an entirely different challenge.  I think one mistake we can make is to get overexcited about creating and subclassing out new objects for ourselves to solve problems.  **It becomes a problem when you have two or more objects doing something that could have been just one**, for example.  In this case the level of complexity is increased beyond what is practical and you only create more work for yourself down the road.  I came to realize I had done just this.  I had subclassed to my heart's desire only to create more redundant and bloated code for myself with more names to remember.  That brings me to my next problem:




#### No naming conventions




When you are working with 20 or so files for a program, you can probably manage their groups and names without too much difficulty.  When you have 200+ files, things start to get a lot busier.  When it all accumulates, you can waste an ENOURMOUS portion of your time searching within your own file base to find what you are looking for.  That is why it is so crucial to **come up with a strict naming scheme that tells you as much as possible about the files' contents in a glance, but also organizes well alphabetically**.  For example, this is the difference between something like "SmallMenu.h","ToggleMenu.h","CombatantMenu.h" vs. "SpriteMenuSmall.h" ,"SpriteMenuToggle.h", "SpriteMenuCombatant.h".  While the second one might read out a bit oddly  and may not seem natural, it organizes well alphabetically and tells you a lot about what the code inside does.  It also hints at how the object was subclassed - Visual Sprite -> That is a Menu -> with particular function.




### Recognizing errors, and learning from them


[![](http://kylnew.com/wp-content/uploads/2011/08/lightbulb.jpg)](http://kylnew.com/wp-content/uploads/2011/08/lightbulb.jpg)While I'd love to say that I was hit over the head one day with this grand epiphany, it actually took some time to fully see the error of my ways.  In fact, it wasn't until I was working on a second iOS mini-game that I came to realize how much better a job I could do with just a little bit of added experience.  My second game got to reap all the benefits of previous work but wrapped into a much more organized and maintainable bundle.

My second game became this sheer delight to work with and in comparison Pixel Fighters became this 'blob', for lack of a better word.  It was a shame too, because Pixel Fighters was (and still is) the game I am truly invested in from a passion perspective.  It is the game I really wanted to be awesome.  So after developing my second game to the point of Beta testing, I shelved it for the undetermined future and returned to Pixel Fighters very much refreshed and full of new solutions.


### Closing thoughts - How far should you take app # 1?


At the end of it all, I think there is an important unanswered question - How far SHOULD you take app #1?  While the answer is subjective and **I welcome discussion below**, the lesson for me is just to always do a little bit of practice first on ANY new platform. ** Some sort of draft always needs to come first. **If you have a plan for your first app already and it's something you want to make big, think of something less ambitious in the interim to test on first. Make sure that whatever you want to consider your real project has a **strong attack plan** going in - it shouldn't be a code adventure for you anymore.


### Next Post - How my first app has become my third


Originally, I had named this post "How my first app has become my third" but instead, I decided to spend more time focussing on learning from mistakes this week.  I'm going to split this into a two parter and talk more about re-developing Pixel Fighters from what I've learned next week.  This will allow me more room to share with you how the game works.  Cheers!


###### Special thanks to [my friend Jordan Sandler](http://twitter.com/#!/Jordan_Sandler) for proof reading



