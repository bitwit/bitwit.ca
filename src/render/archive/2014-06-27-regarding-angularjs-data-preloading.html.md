---
author: kylnew
comments: true
date: 2014-06-27 00:45:33+00:00
layout: post
slug: regarding-angularjs-data-preloading
url: /blog/regarding-angularjs-data-preloading
title: Regarding AngularJS data preloading
wordpress_id: 1679
postDate: 'Jun 27, 2014'
status: publish
disqusId: '1679 http://kylnew.com/?p=1679'
categories:
- Blog
tags:
- AngularJS
- discussion
excerpt: A few weeks ago Gabriel Scholz wrote a blog about frictionless data preloading in AngularJS which I quite enjoyed. He also updated the blog later conceding that there was an even better method. From my experience, neither options were ideal and I wanted to write a short entry on how I propose we preload data
---

A few weeks ago Gabriel Scholz [wrote a blog about frictionless data preloading in AngularJS](http://www.garbl.es/angularjs/preload/2014/06/07/frictionless-data-preloading-in-angularjs/) which I quite enjoyed. He also updated the blog later conceding that there was an even better method. From my experience, neither options were ideal and I wanted to write a short entry on how I propose we preload data in AngularJS. 

### A few objectives

I think that there are a few key attributes that a good solution has to have:

1. It shouldn't pollute the global name space
2. It shouldn't require declaration within the scope of `ng-app` in the DOM
3. You should be able declare multiple pieces of data separately and concatenate them
4. Preloaded data should be optional, not a dependency

### The two previously suggested solutions

1. Gabriel suggested that we put JSON objects inside of `script` tags, identify them by a type such as "text/preloaded" and then parse and add them to a `preloaded` config object via a directive that looks for `script` tags. I actually really like this idea but it didn't satisfy rule #2. Your script tag needed to be inside of `ng-app`'s scope.

2. The blog entry was updated with a solution of simply declaring another module within `script` tags. However, this solution doesn't satisfy rules #3 and #4 very well. I would hate to be declaring and depending on multiple modules of preloaded data.

### My proposed solution

I actually really like Gabriel's method, except for running the search for preloaded data inside of a directive. Instead I say it should be done inside of a `.run()`, which occurs after `.config()` and before `.controller()`. Like so:

<script src="https://gist.github.com/bitwit/b8d1a4fa4806d9acefc4.js"></script>
<script src="https://gist.github.com/bitwit/7763fd56aaebb437a3d5.js"></script>

This method satisfies all 4 rules I stated above. I would love to hear feedback if anyone has a better method.
