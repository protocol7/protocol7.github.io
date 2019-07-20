---
layout: post
title: Adobe SVG Viewer 4
date: 2003-01-25 17:00:51.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- SVG
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2003/01/25/adobe_svg_viewer_4/"
---
Some day ago, Ian Tindale, [posted a message about Adobe Imageviewer](http://groups.yahoo.com/group/svg-developers/message/25766) which actually turned out to be based on a new version of Adobe SVG Viewer. The viewer is bundled with Acrobat Reader and not directly usable as a browser plugin. [Adobe's Jon Ferraiolo confirmed this the same day](http://groups.yahoo.com/group/svg-developers/message/25781)

Of course, some people started playing with it. From a [PDF posted by Dean Jackson](http://groups.yahoo.com/group/svg-developers/message/25792) we were able to extract an embedded SVG file that gave some clues.

[Kevin Lindsey](http://www.kevlindev.com) created a minimal PDF that could contain a SVG file and [a script for creating it](http://www.kevlindev.com/utilities/index.htm). He also showed that the new ASV now [supports cursors](http://www.protocol7.com/lab/asv4/cursor.pdf) (note: the linked PDF files all require [Acrobat Reader 5.1 including the ImageViewer](http://www.adobe.com/products/acrobat/readstep2.html) to work.

I've done some additional experiments:  
Cursors can also be animated (note that if you'r on a Mac, this will likely crash your browser): [example](http://www.protocol7.com/lab/asv4/anim_cursor.pdf)

And the most exciting news, it supports flowing text: ([example](http://www.protocol7.com/lab/asv4/flow.pdf)). The syntax is not exactly that of the lastest SVG 1.2 draft (`region` instead of `flowRegion`), but that's most likely just a timing issue.

According to Jon it also supports embedded video. In the PDF the Dean posted you can find traces of a `video` element in Adobe's extension namespace. I have however failed to get it to work. Any clues would be welcome :-)

If you find out any other differences compared to ASV3, please [email me](mailto:niklas@protocol7.com).

