---
layout: post
title: Surprised by reality
date: 2007-06-12 22:12:37.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Applications
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/06/12/surprised-by-reality/"
---
I'm a big fan of [Wikidpad](http://www.jhorman.org/wikidPad/) and use it for most (if not all) of my digital notes (a trusty [Moleskin](http://www.moleskine.com/eng/default.htm) does the trick for those analog ones). Today I was in a meeting discussing a set of integrations between a few applications. Pictures was drawn on the whiteboard and I was somewhat desperately trying to convey these into wiki text. The results wasn't all that good. This scenario has been played over and over again and I have tried a large number of different replacements for Wikidpad that would be somewhat more "rich" in their content, for example [OneNote](http://office.microsoft.com/en-us/onenote/default.aspx). Still, every time I have returned to old, trusted Wikidpad.   
Now, while in the meeting today I thought that the pictures drawn would be perfect to draw using [dot](http://www.graphviz.org/Gallery/directed/world.html) from [GraphViz](http://www.graphviz.org), another favorite of mine. I went into my text editor and hacked up a simple dot file that described that integration scenarios being discussed. When I was about to save the file, it struck me that since it just text it would be better suited to store it right there in the wiki. I thought that some Python (that's what Wikidpad is written in) hacker should fairly easily write up some code to render it for me. When I was about to start writing an email begging at people over at the dev list, it actually struck me to look at the extensions already shipped with Wikidpad. Lo and behold, right there is was, [GraphvizClBridge.py](http://wikidpad.python-hosting.com/file/branches/mbutscher/work/extensions/GraphvizClBridge.py). And nicely documented as well. So now I got perfectly beautiful dot images just where I want them. Couldn't be happier.

