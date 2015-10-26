---
layout: post
comments: true
date: 2015-10-26 08:00:00+00:00
author: Kyle Newsome
tags:
  - post
  - swift
  - iOS
title: General impressions on Swift 2.0
description: Postcard - A Post Mortem
status: publish
excerpt: I know some developers like myself are just taking their first looks at the language so I wanted to summarize a few thoughts from my first experiences
disqusId: swift-general-impressions
---

I'll be the first to admit that I am not the first person jumping on to Apple's Swift language. I was, admittedly, a bit apprehensive about jumping in after the release of v1.0 over a year ago. My first impressions were the language and its syntax, while very promising, was just not complete enough yet. 

However, with the release of 2.0 several months ago and announcement of a forthcoming open source release, my excitement level significantly increased. I know some developers like myself are just taking their first looks at the language so I wanted to summarize a few thoughts from my first experiences.

Within the last month I decided to delve heavily in to Swift on a new personal project. Overall the transition has been quite easy, given an existing knowledge of Objective-C, and I'm really positive on the future of what Swift will become. The rest of this blog is about four features that got me the most excited.

### Clean and simple syntax

The obvious big win in Swift is a much cleaner syntax. What might not be quite as clearly understood at first glance, is how Swift works a lot like how we understand Objective-C, but with many more assumptions made. Property declarations were kind of out of hand in Objective-C. You were declaring a class' properties in 2 or 3 places across a .h and .m file. It was getting better, but Swift just puts that all behind the curtains.

A simple `var myVariable = 1` is all it takes to get a strongly referenced internal Integer that will be set to 1 on initialization. If thats not what you need, it's mostly about appending words like `private`, `weak`, `lazy` to indicate different behaviour.

### The Swift playground, holy crap, the playground

You may not know, but typing `$ swift` in to your Mac's terminal will open a Swift REPL. A great way to start toying with the language, but XCode's Swift playground takes the feedback loop to a whole new level. Not only can you get immediate feedback on simple statements, you can render views in isolation and play around with visual attributes. You can even review how visual elements changed over time! I found that using the Swift playground was an amazing way to learn about the CAAnimation library.

<iframe src="https://vine.co/v/e9qOTKO1Oix/embed/simple" width="480" height="480" frameborder="0"></iframe><script src="https://platform.vine.co/static/scripts/embed.js"></script>

The Swift Playground gave me a great way to dive in to creating bezier paths for layers to follow during animation. It turned something I might have done in Objective-C over a couple days in to an afternoon of exploration.

### Optionals make Swift more expressive than Objective-C

It's nice how Objective-C ignores messages to nil and all, but sometimes that's just not what you want. It also stinks when you have to go on a witch hunt to figure out what's nil that absolutely shouldn't be. The addition of optionals and the `!` for indicating when one definitely shouldn't be nil gives Swift a much clearer way of expressing what statements truely are and aren't required to succeed.

### Enums are awesome

One of the coolest features about Enums in Swift is the ability to use Strings and Tuples. It makes for an incredibly flexible system for implementing any special type that has a limited set of states. I recently used it to list all of my Sound effects in a clear syntax and avoid listing sound file names like `"ping.wav"` in various files.

## It's worth taking the dive

I'm sure if you take some time to read the [language's documentation][1] and play around for a few hours, you'll get pretty excited too. I really see no reason to write any more Objective-C than I need to at this point. The syntax alone makes Swift very attractive and it's starting to feel very comfortable.


[1]: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309 "Swift Language Documentation"
