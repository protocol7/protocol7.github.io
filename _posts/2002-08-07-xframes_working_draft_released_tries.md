---
layout: post
title: XFrames working draft released. Tries
date: 2002-08-07 10:59:33.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- HTML/XHTML
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2002/08/07/xframes_working_draft_released_tries/"
---
[XFrames working draft](http://www.w3.org/TR/xframes/) released. Tries to fix the [current problems with frames](http://www.w3.org/TR/xframes/#s_intro). The big new thing is that the URL for the frameset can contain URLs for all frames in the format:  
frameseturl.xfm#frames(frameid1=document.xhtml,frameid2=document2.xhtml)

This should solve most of the current problems with frames, but not all. For example, I would like a way to say, in a XHTML document, in what way it should be shown inside of a frameset (without having to do a script or metatag redirection).

