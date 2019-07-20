---
layout: post
title: Bug with inline SVG
date: 2002-02-27 15:11:32.000000000 +00:00
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
permalink: "/archives/2002/02/27/bug_with_inline_svg/"
---
Laurence Pit (the creator of [openwiki](http://www.openwiki.com)) discovered a strange bug concerning inline SVG and Adobe SVG Viewer. I've been looking into it a little bit more, this is basically how it works:  
with ASV 3.0 you can inline SVG in XHTML. But, in IE6, if the XHTML [has a DOCTYPE](svg/doctypeBug/with.html) (and it must have to be XHTML) the SVG will not work at all. If you simply [remove the DOCTYPE](svg/doctypeBug/without.html) it works again. Strange and annoying bug.

