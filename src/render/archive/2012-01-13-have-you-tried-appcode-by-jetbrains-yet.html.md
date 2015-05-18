---
author: kylnew
comments: true
date: 2012-01-13 12:00:16+00:00
excerpt: How many hours are you spending coding in Objective-C these days? Are you being as efficient as you can possibly be? If you haven't tried AppCode by JetBrains yet, there may be room for improvement. AppCode is a recently released Objective-C IDE that has entered the market to make our Objective-C coding process more efficient. Personally, I'm someone who really appreciates it when a 'Point, Click, Click' action becomes a simple press of a hotkey, and it's amazing how those little time savings start to add up.
layout: post
slug: have-you-tried-appcode-by-jetbrains-yet
url: /blog/have-you-tried-appcode-by-jetbrains-yet
title: Have You Tried AppCode by JetBrains Yet?
wordpress_id: 955
categories:
- Blog
tags:
- idevblogaday
- workflow
---

[![App Code Introduction Image](http://kylnew.com/wp-content/uploads/2012/01/Screen-Shot-2012-01-05-at-12.15.06-PM.png)](http://www.jetbrains.com/objc/)
How many hours are you spending coding in Objective-C these days? Are you being as efficient as you can possibly be? If you haven't tried AppCode by JetBrains yet, there may be room for improvement. AppCode is a recently released Objective-C IDE that has entered the market to make our Objective-C coding process more efficient. Personally, I really appreciate when a 'Point, Click, Click' action becomes a simple press of a hotkey, and it's amazing how those little time savings start to add up.


### Why/how I tried AppCode


My discovery of AppCode first started with my discovery of [PHPStorm](http://www.jetbrains.com/phpstorm/), also developed by JetBrains. In the past 9 months, I have been coding in PHP heavily at work - originally on the Eclipse IDE which I thought was as perfect for PHP as it got. I was wrong. In October, after a glitch in my Eclipse IDE forced me to reinstall the program and lose my preferences, I decided to search for an alternative and came upon PHPStorm, which seemed to be well liked by many in the StackOverflow community. Three days into my free trial, I was enamoured with PHPStorm and made the purchase. Sure, I could have stretched the trial to day #30 and then purchased but I was already infinitely thankful for the improvements JetBrains had made to my day-to-day coding workflow.

It was then that I also noticed a product "AppCode" that was soon to be released for the iOS developer community. As soon as 1.0 came out, I gave it a shot but unfortunately didn't code much during my trial period. I recently purchased it over the holidays, however, when I had more time to pursue personal endeavours and have been quite satisfied.


### What AppCode can do for you


Here's a brief list of some of the things I noticed about AppCode. This is not even close to an exhaustive list of everything AppCode does, but rather things that I appreciate or felt were noteworthy. I apologize if my explanations seem convoluted at times - some of this you might need to try for yourself to get it.


##### **Personal favorite** Alt + Up/Down = Smart selection expansion


This is kind of a tricky thing to explain without actually trying it but, in my opinion, it's one of the most awesome features of JetBrains' IDEs, (PHP Storm does this too).
Pressing Alt + UP expands your current selection in a logical fashion
Pressing Alt + DOWN contracts your current selection in a logical fashion

This is a really nice addition to the Alt + Left/Right functions that XCode has (also in AppCode). It is worthwhile mentioning at this point that AppCode fits all its functionality around the XCode hotkeys so they've only added/improved functionality without reprogramming your keymap.


##### Dropdown menus


Here's a simple visual of the different options that are available upon right clicking a file. Notice all the hotkeys set up and the handy refactor options completely missing from XCode among other extras. No additional detail necessary, just some food for thought for you.
[![XCode dropdown](http://kylnew.com/wp-content/uploads/2012/01/Screen-Shot-2012-01-05-at-12.03.14-PM-212x300.png)](http://kylnew.com/wp-content/uploads/2012/01/Screen-Shot-2012-01-05-at-12.03.14-PM.png)[![JetBrains Dropdown](http://kylnew.com/wp-content/uploads/2012/01/Screen-Shot-2012-01-05-at-12.02.46-PM-188x300.png)](http://kylnew.com/wp-content/uploads/2012/01/Screen-Shot-2012-01-05-at-12.02.46-PM.png)


##### Better safeguards


I appreciate that AppCode doesn't let you do certain things the wrong way, such as file refactoring. In Xcode, it is pretty easy to refactor the wrong way if you are new/oblivious i.e. double click your files and rename them, then systematically find and replace all mentions. AppCode simply doesn't have this option, you can only rename by refactoring - I appreciate this safeguard because occasionally I (stupidly) treat XCode like the filesystem and start refactoring the wrong way before I correct myself.

Furthermore, JetBrains also offers a "Safe Delete" refactor that will help you make sure there are no trailing mentions of a file you have deleted.


##### More columns oriented


JetBrains is a highly columns oriented editor. By that I mean that when you click on a new line, your cursor starts where you clicked, and not at column 1, followed by hitting TAB 3 times to start where you wanted. Most of the time XCode is pretty smart about where to put the cursor, but occasionally I feel like I'm fighting with it to type where I want.

Secondly, when you hold ALT + select to highlight text by columns, the functionality is improved over what XCode offers. It is more comparable to how TextMate treats ALT + select i.e. pasting one line across multiple rows, pastes from the clipboard for each row rather than only on the first and deleting on the rest as XCode does. Prior to AppCode, I used TextMate for my more complicated ALT + select needs and then pasted back to XCode. It's nice to have an Objective-C IDE that does it itself.


##### Greys variables and functions not being used in the code yet


You will notice that newly introduced variables and functions will have their names greyed out after introduction. That's because JetBrains monitors your code base to see if this variable or function has been called across the project. I find this particularly handy with objects that I have had to tweak and recode several times. It is pretty easy to leave a whole function in your code that is long since obsolete - AppCode helps you see that.


##### File templates


App Code offers you several file templates to help your new files start off in better shape. Ever wanted more from the XCode class template? - here you go. How about adding an empty **-(void)dealloc{}** to all of your new .m files? Yes please. The file templates even go as far as allowing variables though I have not explored this. I'm sure you can think of even better uses.


##### Spell Check for variables


Ever forget that it's "I before E except after C" when typing out a new variable? AppCode will notice and add a squiggly line. It even reads your multi-word Camel Cased variables for incorrect spelling word-by-word. While this functionality isn't perfect (sometimes you will disagree with its opinion on a variable's spelling), I appreciate the early indicators. You can also adjust your preferences on spell check or disable it completely.


##### Preferences, preferences, and more preferences


Tons and tons of preferences! Introduce entirely new file types and get basic syntax highlighting. Heck!, syntax highlight every file type differently if you are hardcore. There's a lot of power in the preferences of AppCode. I think it demonstrates how flexible/personalizable this tool really is.


##### Tabbed navigation between open files


There are many things I like about the way XCode traverses your files, so I have no criticisms. It is nice, however, that AppCode offers the more common tabbed file navigation that I am used to from all my Web Development IDEs, and Internet browsers. AppCode also includes the ability to split your window several times over horizontally or vertically. Ever wanted to work with two unrelated files directly side by side? AppCode can do that.


##### Actionscript Support


While I am not a flash developer, I think its worthwhile mentioning that AppCode supports Actionscript with syntax highlighting. I don't really know anything about the Flash to iOS process but I thought that this was interesting. It's at least clear that JetBrains doesn't play favourites or do as Apple says - they are just thinking about what makes our coding easier.


### Still early days for AppCode


AppCode 1.0 was released at the end of October 2011, so it is a brand new IDE, only a couple of months old. For such a young IDE, I would say it has started off quite polished, leveraging some universal JetBrains code base for all their IDEs, I'm sure. However, it is not without flaws and growing pains.

For one thing, AppCode is currently NOT a replacement to Xcode, rather it is a full-featured supplement. The good news is that AppCode is built to play very nicely with XCode so leaving them both open is a non-issue.

Admittedly, I have had occasional issues with compiling and running projects on AppCode, so I sometimes code in AppCode and switch to XCode for my compile needs. I'm confident that these are just early issues that will sort themselves out sooner rather than later - JetBrains is switched on and very responsive to developers feedback.

I also have been told that Version 1.5 is due for late Q1/Q2 of this year, so a new leap of improvements is just around the corner. There is also an attractive Early Access Beta Program available - read on...


### The price tag


AppCode starts with a 30-day full access free trial. Better yet, you can use their Early Access Beta release to AppCode Version 1.5 entirely free until its official release in a few months from now. The regular price of AppCode is $99 for a personal license. I purchased AppCode as a nerdy gift to myself over the holidays while it was on sale for $69.

I know I will be coding a lot of Objective-C this year and believe it is well worth it. I have this feeling that some readers will immediately dismiss AppCode right after hearing the price. If you are a developer hobbyist currently learning the language, or just not coding Objective-C enough these days, I understand. However, if your day-to-day involves heavy amounts of Objective-C coding, I think it's important to consider this IDE. It probably costs two of your work hours (depending on what you quote freelance) and could save you a ton more hours in the future. If you work for a company, perhaps you can convince them to front the cost of a transferrable company license ($199).


### In conclusion


If you haven't tried JetBrains' AppCode yet, you really have nothing to lose. There is a full access 30-day trial period that is well worth checking out and an even longer Early Access Beta program that will let you trial their latest Beta release indefinitely until official deployment. If your day-to-day consists of a lot of Objective-C coding, I think you will appreciate the little extras that JetBrains puts into their IDEs to make them as flexible and work-efficient as possible.

Personally, I'm excited to see a competitor in the Objective-C IDE market, particularly JetBrains since they wooed me over with PHPStorm. However, AppCode is only going to be as good as we make it. If we don't ever give it a shot, if we don't tell them what we like and what we want, and if we don't submit issues we'll never see the full potential. I've definitely heard my share of moans and groans about the quirks of XCode - here is a company that wants to help us "develop with pleasure", as their slogan says. JetBrains is very committed to continuous improvements of their products. I am a massive fan of PHPStorm (now version 3.0), and I've heard wonderful things about their Java IDE as well. These are two of their more successful and mature products - I think AppCode can become one of them too.

So [give it a shot](http://www.jetbrains.com/objc/) and see if this product is right for your coding workflow. If you aren't ready for it yet or not coding enough Objective-C to justify the purchase, keep your ear to the ground for the future because AppCode is only going to get better.
