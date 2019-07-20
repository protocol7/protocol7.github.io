---
layout: post
title: SVG enabled
date: 2005-05-03 23:41:28.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Standards
- SVG
meta:
  tags: svg firefox
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2005/05/03/svg-enabled/"
---
[Tor](http://weblogs.mozillazine.org/tor/archives/2005/05/20050502_weekly.html) has checked in some of the final missing pieces for fully enabling SVG in Firefox 1.1. First, [the special build names has been removed](http://bonsai.mozilla.org/cvsview2.cgi?diff_mode=context&whitespace_mode=show&subdir=mozilla/toolkit/mozapps/installer&command=DIFF_FRAMESET&file=package-name.mk&rev1=1.3&rev2=1.4&root=/cvsroot) (you know, for example with -svg-gdiplus) and [SVG has been enabled](http://bonsai.mozilla.org/cvsview2.cgi?diff_mode=context&whitespace_mode=show&root=/cvsroot&subdir=mozilla/modules/libpref/src/init&command=DIFF_FRAMESET&root=/cvsroot&file=all.js&rev1=3.571&rev2=3.572) (you now longer have to change the svg.enabled property to see SVG). This is very cool! We are now close to finally getting good (albeit not yet perfect) SVG support in the [second](http://www.mozilla.org/firefox) and [third](http://www.opera.com) most prevalent browsers out there (I have no hopes for native support in IE). SVG 1.1 (especially mixed in the same document/DOM as (X)HTML) is a powerful tool in the web developers toolbox and this might actually make quite a difference.

Now, how long until Google Maps comes in SVG?

