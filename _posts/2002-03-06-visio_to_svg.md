---
layout: post
title: Visio to SVG
date: 2002-03-06 01:38:42.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Uncategorized
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2002/03/06/visio_to_svg/"
---
[Rob Fahrni](http://rob.crabapples.net), a guy on the Visio team, made this funky script that turns a [OPML](http://www.opml.org/) file into a Visio drawing. Before I read about this I didn't know about the Visio XML format, VDX. A XML format that is totally full-circle is a very good idea and opens up many possibilities. The most obvious one for me: turn it into SVG using a XSL stylesheet.

So, [here](http://www.protocol7.com/visiosvg/default.asp?ie=.svg) is the first attempt. It's based on Rob's states.vdx file and is generated on the fly. The XSL stylesheet is only 90 lines of code. I will release it as soon as I have added more functionality and cleaned it up some more.

