---
layout: post
comments: true
date: 2018-06-01 14:00:00+00:00
author: Kyle Newsome
tags:
  - post
  - software
  - rxswift
  - ios
title: Adventures in MVVM with RxSwift
description: After having played with RxSwift in several projects I wanted to try to use it in an app with MVVM architecture principles
status: publish
excerpt: After having played with RxSwift in several projects I wanted to try to use it in an app with MVVM architecture principles
disqusId: adventures-in-mvvm-rxswift
---


In the last couple of days I found some time to work on a simple iOS To-Do app. It's written using RxSwift and MVVM architecture. [The code is open source on GitHub][1].

I've experimented with RxSwift in several other projects and enjoyed it. This was the first time I've tried making an iOS app from scratch with MVVM and the RxCocoa extensions. I implemented a few features that would challenge RxCocoa. I thought inline editing in a collectionview and undo/redo would work. Here are some quick thoughts about it.

<img class="img-thumbnail" src="https://github.com/bitwit/The-Do-List/raw/master/the-do-list-app.gif" />

### It feels clean, but there's more work involved upfront

I'm a fan of the lightweight view controller that is primarily focused on bindings and isolated viewmodel code. Setting things up feels a little slow at first compared to the gains we are typically used to seeing with MVC. However, the clean separation of logic lays down some really nice foundations that give me a sense of maintainability and ease of testing. The undo/redo functionality worked itself really nicely into the viewmodel layer which felt like a nice abstraction.

### Working with UI as you are editing is sometimes tricky

I ran in to two notable areas of difficulty that related interaction with UI while editing content simultaneously

1. Using the RxCocoa basic example of connecting a tableview, you get left with a table that reloads it's rows on every change
2. While typing in a textfield, relaying the text changes immediately would cause a feedback loop from the 'updated' signal.

The first problem was reasonably straight forward to fix. You're simply better off using the `items(datasource:)` function and being your own data source. However, this burderns you with the responsibility of diffing your own changes. There's a GitHub repo RxDataSources that make this easy. I ran into some issues with this repo, likely due to version mismatching so I ended up using an existing diffing algorithm I've written.

The second problem seems to have no ideal solution. I've tried two solutions now:

1. If `textfield.isFirstResponder == true`, then I didn't update the textfield since I could assume it's up to date. This seemed like the easiest solution to not fighting UIKit. However, I've realized since posting this blog earlier today that this causes the current editing cell to ignore changes during Undo/Redo.
2. My current solution is to not update the textfield from its delegate methods. If `textfield.isFirstResponder == true` then when the model updates I copy the previous `textfield.selectedRange` over and nudge it in the appropriate direction. This way the cursor position is maintained while actively typing.

This goes to show some of the nuanced challenges of RxCocoa extensions when you dig in deeper.

### Next Steps

I'm enjoying working on this project so far and might work on a few more things like connecting a webservice and syncing list results. I hope this might serve as a useful example to someone, feel free to ask questions or give feedback here or [on the code's GitHub repo][1]

[1]: https://github.com/bitwit/The-Do-List