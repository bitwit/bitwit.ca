---
layout: post
comments: true
date: 2015-10-30 14:00:00+00:00
author: Kyle Newsome
tags:
  - post
  - iOS
title: iOS9's Mail.app has weird swipe gestures
description: While doing some research on swipe gesture patterns in iOS apps recently I revisited the default Mail app installed by Apple.
status: publish
excerpt: While doing some research on swipe gesture patterns in iOS apps recently I revisited the default Mail app installed by Apple.
disqusId: swipe-gestures-ios9-mail-app
---

While doing some research on swipe gesture patterns in iOS apps recently I revisited the default Mail app installed by Apple. I've been a user of Mailbox since its release a few year ago so the default app is mostly just an icon on my home screen.

At the time when I switched, swipe gestures were limited in the default app, but they have expanded over the last few major updates to iOS. I was surprised to return most recently to find some gestures that I find a bit sloppy. Watch this small recording I made:

<iframe width="300" height="169" src="https://www.youtube.com/embed/Y6koMITKDxU" frameborder="0" allowfullscreen></iframe>

Did you catch all that? I certainly didn't. Let's break down what's going on.

### Let's break this down

First I pull to the right to reveal a blue area with a 'Mark As Unread' ability. If I swipe only about half way, it is simply revealed as a button. If I swipe beyond half way, the blue area *races* to catch up with my finger and automatically executes if I release.

Next, I pull to the light, which has a similar reveal effect, however, this time there are **3** differently coloured options, 'More, Flag, Trash', revealed. If I swipe beyond half way, the 'Trash' option catches up with my finger and automatically executes if I release. The other 2 options do not have a swipe/release way of being executed.

At the very end of the video, I actually didnt even intend to swipe all the way and trash that mail item, but it enforced the point I'm about to make.

### Reveal and long swipe gestures in one is a bad recipe

Having actions that first start as 'reveal then tap' suddenly changing into a 'long swipe' is quite confusing. I'm going to give the first swipe gesture a break because it was only 1 possible action and, in effect, was just 2 ways to do the same thing. However, I think the animations and colours could be improved still to better signal that releasing from a long swipe is going to execute the action though.
The left directional swipe which reveals 3 actions that collapse in to 1 'trash' option on a long swipe, is just messy though. Not only does it suffer from confusing transitional animations but the fact that I could intend to flag something and instead trash it by just swiping a little too far is a recipe for user error.

### What works better

In my opinion, there are a few things I would do here to improve the experience but also make as little change as possible.

First, I would improve the transitional animations from reveal to long swipe. If the back panels are already coloured, then the icon needs to animate somehow, possibly with a checkmark or some indicator that the state is already changing before your finger releases. Take the Mailbox app, for example, which circles the icon with an arrow when you hold it. This is a slightly different type of action, but conveys the same idea that the icon can tell us more about how our gestures are affecting state.

Secondly, I would get rid of the long swipe gesture to auto trash items, or reduce the actions to a single option at a time. Mailbox introduces the idea of short and long swipes changing the executed action all together, which is accompanied by a colour and icon change. This could be used to toggle between 'Flag' and 'Trash' states but I wouldn't put more than 2 in a single swipe before things would get too granular. This is why I think just sticking to reveals is best and most consistent.

### Use swipe gestures with caution

I'm a big fan of swipe gestures on table cells to reveal and execute actions. It's a great way to get interaction without requiring buttons all over your list items. However, they need to be used with care and restaint. I would still consider them to be intermediate to advanced user actions, so it's important to think of how the audience will learn these gestures and adapt them over time. Sensitive gestures that have not been carefully introduced may leave some wondering what just happened and how on earth to undo (An action hidden behind an even more obscure gesture - literally shaking your phone).
