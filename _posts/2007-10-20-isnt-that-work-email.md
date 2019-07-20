---
layout: post
title: Isn't that work email?
date: 2007-10-20 13:52:09.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Uncategorized
meta:
  tags: ''
  openid_comments: a:1:{i:0;s:5:"77809";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/10/20/isnt-that-work-email/"
---
I'm using GMail for both my personal and my work email. That means I have to remember to choose the correct From address for different recipients. I usually don't.

[Greasemonkey](https://addons.mozilla.org/en-US/firefox/addon/748) to the rescue. I searched [userscripts](http://userscripts.org/) without finding anything that matched my needs, so I [wrote one](http://userscripts.org/scripts/show/13143). It quite simply asks you for your work email and a set of patterns to match for. For every email you then compose, it will search the To field for the patterns. And if one match, and your From address doesn't, it will warn you. Works for me. For the patterns, I keep a list of the domain names for the clients and partners I work with.

Now, this is my first Greasemonkey script so please be kind, but [report back](mailto:niklas@protocol7.com) any troubles or improvements. Also, I've found that other scripts I've used for GMail as frequently broken due to Google updating the site, if this happens to this script I'll be happy to keep it in shape if you remind me.

Technorati Tags: [gmail](http://technorati.com/tag/gmail), [greasemonkey](http://technorati.com/tag/greasemonkey), [userscript](http://technorati.com/tag/userscript)

