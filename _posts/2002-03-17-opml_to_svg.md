---
layout: post
title: OPML to SVG
date: 2002-03-17 02:55:32.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- SVG
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2002/03/17/opml_to_svg/"
---
I got this idea from a a Flash site (_edit: fazal helped me, it's [http://www.relevare.com](http://www.relevare.com)_). They have a really nice navigation that is a very good way of visualizing a tree view in a limited area. So, I thought, this would be a perfect way to take a [OPML](http://www.opml.org) file and view it using SVG. So, here it is (this is a small example):  
[OPML file](/experiments/svg/opml_to_svg/p7.xml)  
[XSLT file](/experiments/svg/opml_to_svg/opml.xsl)  
[Resulting SVG file](/experiments/svg/opml_to_svg/default.svg) (you need the [Adobe SVG Viewer 3.0](http://www.adobe.com/svg) to see this, animation does not work in Firefox, please email me if you fix it)

There are a few limitations when using this: it's best to have 4 outline elements as children of the body and max 7 outline elements as children of another outline. And texts can not be to long or they won't fit. Otherwise it works pretty good. If you use it, please give me your link :-)

