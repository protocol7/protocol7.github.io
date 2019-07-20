---
layout: post
title: Long-running Thunderbird bug
date: 2007-01-13 11:15:28.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Development
- Open source
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/01/13/long-running-thunderbird-bug/"
---
Sometimes its amazing how slowly development can work. [This bug](https://bugzilla.mozilla.org/show_bug.cgi?id=223132), the lack of scrollbars for the headers panel in Thunderbird, has been open for more than three years. The fix, based on the comments, seems to be a CSS addition of less than 10 lines. The bug has 72 votes and 112 comments which should make it a fairly popular bug. Still, it's not fixed in Thunderbird 2.0 beta 1.

Luckily, [there is a great extension](https://addons.mozilla.org/thunderbird/1003/) that does fix the problem, and with some hacking of install.rdf it seems to work in 2.0 beta 1 as well.

