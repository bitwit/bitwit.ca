---
author: kylnew
comments: true
date: 2011-08-16 13:30:20+00:00
excerpt: 'A quick comment on last week''s post and a story about some of my developments over the last 6 months improving my original game by trying something completely new first.  Beta testing for Pixel Fighters : Chapter Two starting within 2 weeks!'
layout: post
slug: how-my-first-game-has-become-my-third
url: /blog/how-my-first-game-has-become-my-third
title: How my first game has become my third
wordpress_id: 454
categories:
- Blog
tags:
- idevblogaday
- pixel fighters
- pixel fireballs
---

### A comment on last week's article


I want to take a moment to thank everyone who left feedback on my last entry and shared their perspective.  Last post, I focussed on the idea of not releasing your very first app.  I agree that, taken on its own, this is not the best advice.  While it was not really my intended message, I think I overreached in my title and with some of the phrasing in my article.  Many who shared feedback rightly pointed out that the opportunity cost is too high NOT to release - you are better off to release and then rebuild rather than vice-versa.

From my personal experience, I think that building a mini-RPG was an ambitious first choice for development.  Not really knowing any better though, I went with my favourite genre to play.  Perhaps the best advice is "don't make your first app an RPG" or "keep it simple stupid!".

Having released something that may have been excessively complex for my first attempt, I was very challenged when it came to planning the next steps and improvements for the app.  I wasn't so sure that diving back in to what I had made was the best approach for moving forward.  So, I decided to take a short breather, re-use the art from Pixel Fighters and make a small and simple project that I could pool all my learnings so far into, and see what the result might be...


## Pixel Fireballs



Above you can see a YouTube demonstration of the game I built and beta tested a few months ago -  a very simple endless dodge and reflect game using Cocos2D again and Chipmunk for physics.  Below, I've diagrammed a very loose idea of the structure I pre-planned before coding.  This isn't anything fancy - I just found it very useful to spend some time jotting ideas down in a notebook prior to doing any actual coding. My main goals were to keep the game simple, learn a bit about physics engines, and build with a _general_ gaming mindset - I wanted a base that would work well across different types of small to medium size games.  One of the first things you might notice is the occurrence of DTF - which stood for "Dodge the fireballs" - when I first started this.  Everything I made began with this naming scheme, which I based loosely on the Cocos2D naming scheme.  I found it MUCH easier to traverse my files and code with a distinguishable and structured naming scheme for my personal code.




[![](http://kylnew.com/wp-content/uploads/2011/08/Dodgethefireballsdiagram2.png)](http://kylnew.com/wp-content/uploads/2011/08/Dodgethefireballsdiagram2.png)





### AppDelegate


The App Delegate starts the application up obviously, as well as the cocos2d engine and game center, in my case, prior to starting up the Game object.


### DTFGame


The Game is the central manager my first game was missing.  While I had read many tutorials and books that included this concept, perhaps it took missing one to understand why I needed one. I tried to keep this class as generic and re-usable as possible, mostly working with elements that would exist in **any** game.  It gets everything loaded, carries the references and initiates the game mode.


### DTFMode and DTFModeRulesSet


The **Mode** is where all the central game logic lay, always modified by a **Rules Set.**  Mode and Rules Set is a relationship I used to manage different game rules without having to tear down and rebuild the game when different options or styles of play were chosen by the user.  The basic idea was to keep the same game running at all times and just change the rules in order to make a tutorial mode, 1 player mode, 2 player mode, etc.. as needed.  I found that this worked really well for me:  it keeps the central game logic free of too many conditions and instead passes notifications and parameters off to the rules set which, in turn, takes actions or manipulates the central game logic.  Additionally, it improved loading times significantly because less stuff needed to be deallocated and reallocated into memory when a reset or change occurred.


### DTFEntity and DTFLayer parent classes


The rest of my game entities and visual layers all subclassed from a general Entity/Layer class respectively.  I made sure that I spent less time writing how each different game entity or layer might behave and inherited as much as possible from the parent.  A simple concept lacking from my first game.


### DTFSceneGame


I realized after making Pixel Fighters that I was also overusing scenes, frequently tearing down everything visually and rebuilding it for any change in UI.  Transitions are nice, but sometimes they are just overkill, especially when you are trying to keep things simple.  What I really needed instead were more layers that could be swapped in and out easily and quickly.  Furthermore, I didn't really see why there needed to be many different types of scenes created.  After all, if a scene can already swap in any UI Layer it wants, there's _certainly_ no reason to have different scene classes for an options menu, main menu, title screen, selection screen etc. unless you are drastically changing what's going on in the background.  I've found I can pretty much cope with a Game Scene and a Story Scene, maybe a Title/Menu Scene - the rest is all in layers.


### Planning memory


In addition to taking the time to plan out structure prior to coding, I also made sure to deal with memory from the start.  I wasn't creating new code to deal with memory issues later; rather, I was proactively making sure things handled themselves correctly.  Better yet, my first priority was trying to keep as much as possible loaded once, so I wouldn't need to allocate again.  For example, in the case of the fireballs, there is a pool of about 20 fireballs that are activated and used as necessary for the entire game.  Allocations cost you performance and frame rate anyway, avoid them when possible.


## Taking the learnings back to Game 1


Having taken the time to more carefully plan before executing, I was very happy and impressed with Pixel Fireballs.  I was particularly happy with the cleanliness of the code in comparison to the Pixel Fighters. After taking it to beta testing and feedback gathering, I was ready to use as much of this code as possible on the original game.

Next to the sheer level of improved organization, one of the most useful concepts that had emerged out of this second game was Mode and Rules Set.  When developing Pixel Fighters, I had an enormous problem with handling different conditions for different game modes.  After all, the game has a Tutorial mode, 1P Adventure Mode, Practice Mode, 2P split screen Mode, 2P Bluetooth Mode and 2P Online Matchmaking Mode.  I had one delegate object whose job it was to basically take this mayhem in and spit out the right condition.  This old object, split into many more organized smaller pieces, became one of my game's many organized Rule Sets.

I stripped Pixel Fighters of the many redundant scenes and unnecessary transitions between every single screen.  Most scenes became layers with their own separate controllers.  These layers could be swapped in an out of a scene very easily, and cached by the scene (in case of re-use) until it was replaced with another scene.

With those fundamental improvements, the core of the original Pixel Fighters was thrown out and a new core, emerging from my fireballs game, took its place.  Most of the specific game objects otherwise remained the same.  The transition to a solid foundation was a huge success!  Now, if only the game's central logic code had been as clean and organized as its outer frame...


### The next challenge


With all the wonderful changes I was making came more realizations of just how much improvement I could make to the game's central code. On the horizon I saw a looming issue - I had been hard coding every single combatant action in my RPG.  If you have any familiarity with the RPG genre, you probably have some understanding of just how many different possible actions there are in a typical RPG - hard coding like this couldn't continue. Seeing as I wanted to build on the game and increase its level of complexity in the next update, I knew I had more work on my hands to get the whole game up to par.  So, back to the notepad I went before immediately taking on the next steps of Pixel Fighters.

For the last several months, in balance with my new job, I've been working on a lot of the Pixel Fighters' game logic to bring it up to the next level.  The process has been much slower than desired, but worth the effort. The game could not have gotten to where it is now without a significant overhaul.  Well, it might have - but not without coding in a way that would have almost felt _administrative_ in its redundancy.

That's why I now consider it my third game - completely reborn from its original self, through the assistance of an intermediary project and soon to be released into the wild.  Within the next 2 weeks I expect to be beta testing - hoorah!  I'm glad I took the time to step away and gain the additional perspective, not to mention having a post-launch breather.


### Next post - On being self taught


For my next entry, I'd like to take some time to share some experiences, goals and challenges. Development is a relatively new passion of mine, but it feels like it was a sleeping giant inside of me. I don't know very many developers locally and it has been difficult at times knowing what to do next - more on this next week. I hope that those in the same boat as me, as well as the formally educated, will join in the discussion and share their experiences.

p.s. Pixel Fireballs was put on the shelf temporarily after taking my new job but will hopefully be released by the end of the year. While it's frame was great, it needs more time spent on tuning the central game logic and fun factor.
