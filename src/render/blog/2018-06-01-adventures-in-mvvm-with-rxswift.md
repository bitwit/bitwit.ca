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

In the last couple of days I've found some time to work on a simple iOS To-Do app written using RxSwift and MVVM architecture. [The code is open source on GitHub][1].

I've experimented with RxSwift in several other projects but this was the first time I've tried making an iOS app from scratch with MVVM and the RxCocoa extensions. I tried to implement a few features that would challenge RxCocoa such as inline editing in a collectionview and undo/redo and wanted to blog some quick thoughts about it.

### It feels clean, but there's more work involved upfront

I'm a fan of the lightweight view controller that is primarily focused on bindings and isolated viewmodel code. Setting things up feels a little slow at first compared to the gains we are typically used to seeing with MVC. However, the clean separation of logic lays down some really nice foundations that give me a sense of maintainability and easy of testing. The undo/redo functionality worked itself really nicely into the viewmodel layer which felt like a nice abstraction.

### Working with UI as you are editing is sometimes tricky

I ran in to two notable areas of difficulty that related interaction with UI while editing content simultaneously

1. Using the RxSwift GitHub repo's example of connecting a tableview up to an Observable leaves you with a table that reloads all of it's data on every change
2. While typing in a textfield, relaying the text changes immediately would cause a feedback loop when the textfield was then updated from the 'modelUpdated' signal

The first problem was reasonably straight forward to fix. You're simply better off using the `items(datasource:)` function and being your own data source. However, this burderns you with the responsibility of diffing your own changes. There's a GitHub repo RxDataSources that make this easy. I ran into some issues with this repo, likely due to version mismatchin so I ended use an existing diffing algorithm I've written.

The second problem was a fast fix. If `textfield.isFirstResponder`, then I don't update the text since I can assume it's up to date. I'm uncertain of this solution's correctness in MVVM principles but I believe it might be about as close as you can get without without fighting UIKit.

### Next Steps

I'm enjoying working on this project so far and might work on a few more things like connecting a webservice and syncing list results. I hope this might serve as a useful example to someone, feel free to ask questions or give feedback here or on the code's repo

[1]: https://github.com/bitwit/The-Do-List