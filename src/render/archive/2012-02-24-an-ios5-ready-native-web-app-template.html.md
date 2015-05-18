---
author: kylnew
comments: true
date: 2012-02-24 10:00:34+00:00
layout: post
slug: an-ios5-ready-native-web-app-template
url: /blog/an-ios5-ready-native-web-app-template
title: An iOS5 Ready Native Web App Template
wordpress_id: 1029
categories:
- Blog
tags:
- idevblogaday
- tutorial
---

Several months ago, I wrote a [template/tutorial on developing a Native iOS Web App](http://www.bitwit.ca/blog/an-native-ios-web-app-tutorialtemplate/) that seized the phone's camera functionality. Since then it has been a relatively popular article on my blog, iOS5 was released and I've also received some questions/feedback. So, I thought it might be appropriate to revise this template, based on the previous one and go over the changes. [Download the code here.](http://kylnew.com/wp-content/uploads/2012/02/Web-View-Controller.zip)

Let me begin by saying that this template isn't anything like or close to Phone Gap.  If you are serious about portability and want to remain Objective-C illiterate, Phone Gap is a better alternative. This is just a basic template for those who want a Native iOS Web App with the possibility to dive into as much or as little Objective-C as you like. It's more like an alternative to Interface Builder. The template comes with camera functionality and some basic Javascript-to-Objective-C message sending.

So lets briefly discuss what we are going to do:


	

  * This template will use ARC (Automatic Reference Counting) introduced in iOS5


  * We won't use Interface Builder at all in this template


  * We will instead create a subclass of UIViewController and place a webview on top programatically


  * The class will automatically detect objc:// schema links and try to run that method in a custom delegate class we will build





## The HTML stuff


First let's briefly revise the basic HTML view we will load. You should notice that 3 out of 4 of the links are seemingly dead - these will be linked with Objective-C once inside of the iPhone. I tried to make this template look a little bit nicer looking and iPhone-like than the last one. The buttons are inspired by [Chad Mazzola's CSS3 Buttons](http://hellohappy.org/css3-buttons/) and I'm using the [jQuery library](http://www.jquery.com). If you are loading pages via the web and interested in a smaller Javascript library, check out [Zepto](http://zeptojs.com/)








      
    


        [jQuery Alert](/)  

        Enter your name:
        
        [Objective-C Alert](javascript:objcMessage();)  

        [Take a camera image](objc://takeCameraImage)  

        [Image from library](objc://takeLibraryImage)  

    


      
    ![](http://kylnew.com/wp-content/uploads/2011/09/iphonebattery1.jpeg)

  










* * *





  
  



## The XCode Project


Now we can move on to our XCode project. You can build your own or follow along in the [sample code](http://kylnew.com/wp-content/uploads/2012/02/Web-View-Controller.zip).
I've used a simple View Based Application. First thing, we will temporarily ignore the UIViewController that XCode makes for us with the template and create our own file from scratch - Call it "WebViewController" and its contents will be as follows:



The code is well commented but let's look at the functionality of this class from a high level.




  * On _viewDidLoad_ the class instantiates a UIWebView programatically and adds it to the view


  * We set the class as the UIWebView Delegate, so it will listen directly to the UIWebView we added


  * The class has two functions to load either a URL or a local .html file


  * We receive a callback from the UIWebView to ask permission to follow any link with **webView:shouldStartLoadWithRequest:navigationType:**


  * We listen in the callback specifically for "objc" schemed links and we fire the appropriate method on our **WebViewControllerDelegate** if it can respond to this method


  * "objc" schemed links can also send string parameters. For example, **"objc://doThis/then/that"** would run a method 
  
**-(void)doThis:(NSArray *)data**
  
and the NSArray would have 2 NSStrings : @"then",@"that" 


  * For convenience sake if there is only 1 parameter, it will pass as a   
**(NSString *)** instead



Speaking of our **WebViewControllerDelegate**, let's look at it next:



The WebViewControllerDelegate is only responsible for dealing with methods that are intended to be called from HTML. In my previous template, the equivalent delegate class was also the UIWebViewDelegate, so it was the gatekeeper for following links as well.  However, I feel it is wrong to do this for one important reason: You should have a fresh delegate capable of **only** responding to methods you actually want exposed to HTML.  Using the old method from my previous template, we were effectively exposing methods more methods that we wouldn't really ever want to call. With that, you could argue that my UIImagePickerController related methods shouldn't even be in this delegate. If this template was more complex, I would have moved it out.

To summarize the functionality we are seeing:



	

  * The **message:** function can accept a single string parameter and tell you your name. We set up a corresponding method in javascript that took the name from the input box and added it as a parameter. (As an aside, you could use a "/" in your name and see how multiple parameters work without crashing the app)


  * We have a **takeCameraImage:** function which checks if your device has a camera and then launches a UIImagePickerController


  * We also have a **takeLibraryImage:** function which opens the photo library instead


  * After selecting an image, a Javascript function **processImage( img )** is called to pass over the Base64Encoded image from Obj-C





#### One last step


So with that, we are set up and ready to do some Native iOS HTML'in , there's just one more thing.  Go back to our original UIViewController that we ignored at the start and subclass it from WebViewController instead, like so:



And it's just that easy. In one simple line in our **viewDidLoad** we are now capable of loading HTML files that can call exposed obj-c methods that we write. The nice thing about this template, is you can subclass it to your heart's content and reuse the functionality easily in multiple places across a more complex app.



#### In Summary


So now you have your Native iOS5 ready Web App. You can now code your views exclusively in HTML/CSS/Javascript and take full advantage of an Objective-C backend on your iPhone as desired. If you have any questions, let me know and I will try and respond/amend asap.

[Download the code here.](http://kylnew.com/wp-content/uploads/2012/02/Web-View-Controller.zip)
