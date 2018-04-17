---
layout: post
comments: true
date: 2018-04-17 14:00:00+00:00
author: Kyle Newsome
tags:
  - post
  - coding
title: I'm sticking to strong types and avoiding comments
description: This blog is long overdue for an update, so let's kick things off with a hot take on loosely typed languages, inline commenting and other ways to shoot yourself in the foot
status: draft
excerpt: This blog is long overdue for an update, so let's kick things off with a hot take on loosely typed languages, inline commenting and other ways to shoot yourself in the foot
disqusId: sticking-with-strong-types
---

After years of silence on this blog, I decided that in the wake of more free time after the completion of my most recent contract, I should really hit the publish button again. So what better way to reignite the fire than come in hot with a strong opinion on loose types and inline comments.

### A few kind words about loosely typed languages

Before I begin, I should say some nice things about loosely typed languages. They've kept me gainfully employed for many years, so I owe them at least some credit. Through PHP, Python, Javascript and Ruby I've done many great things of which I am proud. Not so much the code, but the end result. What users actually see.

Loosely typed languages are great for moving fast and prototyping. They are great for just getting the job done. Frankly, that seems like a pretty good reason to pick one and consider yourself a responsible developer. Afterall, coding like a romantic, fixated on all the semantics, will not impress a lot of employers who only measure in feature/fix output. No one is ever going to snapshot and frame your elegantly written function and place it on their desk next that one of the wife and kids.

### Now let's get real

If you've worked on a larger loosely typed project or even your own over a long period of time, how do you feel about these languages now? From my experience that's where things get a heck of a lot more complicated for a number of possible reasons.

- Type mismatch bugs slowly start to creep up. <br />e.g. numbers that should be strings and vice versa
- Lack of type information in function signatures leaves you reading deeper into the code for hints
- The necessity to add more comments emerges, to improve clarity
- Refactors are more cumbersome without a really realiable IDE. Renaming things requires more vigilance.

#### Sure there's solutions but..

There are ways to mitigate these problems, absolutely, but I think they all just demonstrate that what you really wanted was a more expressive programming language in the first place.

So you write a lot of unit tests and they help you catch some of these problems. Now you're testing suite is doing two 2 jobs - testing your code AND compensating for the shortcomings of your chosen language.

Maybe you run a bunch of extra linter tools to catch issues as soon as possible and keep the code in check, but again, you're sometimes introducing tools that come for free in the strongly typed world. Compiler warnings and errors are your best friend and their analyses are not 3rd party modules prone to go out of date with the language as it evolves.

My favourite, by far, however is the choice to add comments as documentation of types. Pure gold. Your comments are as loosely typed as the languages they live in. Watch how fast those get out of date.

### Which brings me to my next rant

While we're on the subject of comments let's talk a little more about commenting and it's relationship to loose types. While the two are seemingly not directly related, they are often combined in a way that demonstrates a misguided attitude on the importance of code quality.

The reality of coding is that you are never writing the code for yourself, ever. At it's closest you are writing code for future you. To think that the code you write in a given moment exists just for now, or temporarily is a trap. That trap leads to bad variable names, quickie solutions and the fix-it-later attitude that turns into a comment-it-later reality.

If I told you that I never write fast and loose code to get something fuctional I would be a bold faced liar. I get it, it happens. Sometimes it is downright necessary to move quickly. In those moments I'm glad to work with a strong typing system.

### The compiler is my companion

The compiler is my little robotic pair programmer. As I type it validates my reasoning and challenges me to be reasonable as I strive to move quickly. My code may not always be perfect but the pieces fit tightly. When I return to an old function, it's inputs and outputs are immediately understood. I know what other functions behave just like this one in my application. Even if the code inside isn't great, I can quickly evaluate all its dependencies and that's a huge part of understanding how any function transforms the world around it.

### Languages of choice lately

#### Swift
I've been writing Swift for the last 3 years and absolutely loving it. The language is far from perfect, and compiler times need to be singificantly improved but it is such a beautifully expressive language that I am bullish on it's future.

#### TypeScript
I have written a LOT of Javascript in my life. Much to my chagrin, I also expect to return to it some day. Given it's prevalence it is a hard force to ignore in the marketplace and I like to remain polyglot. It's such a messy language though, and lacks the kind of structure I yearn for.

As a result, I've recently been toying around with TypeScript and am satisfied that it puts a layer of sanity over javascript that I'd be much happier working in. Even the interfaces for objects in Typescript along seem incredibly powerful for better code documentation without turning to comments. A lot of popular JS repositories also have TypeScript definition files that make communicating with the libraries a pleasure even if they weren't written in TypeScript originally.

### Change my mind

I'm pretty certain at this point my faith in loose typing is unsalvageable but I'm always open to new ideas. Furthermore, this blog entry wasn't written with the intent of dotting every I and crossing every T. I've just got to get blogging more frequently, so I'll follow up in future with more thoughts as they emerge.
