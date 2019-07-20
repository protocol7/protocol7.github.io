---
layout: post
title: apt-get for Windows - still looking
date: 2006-11-20 00:13:08.000000000 +00:00
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
permalink: "/archives/2006/11/20/apt-get-for-windows-still-looking/"
---
Almost a year ago [I wrote a piece on Google Pack](http://protocol7.com/archives/2006/01/07/google-pack-apt-get-for-windows/), suggesting it would be the apt-get for Windows. Well, turned out that nothing much happened about that. So far all there is in the Pack repository is the stuff that was in there from day one, and now also Skype (however it doesn’t seem to be available in Sweden, funny as it was built by a swedish guy). Not a lot of progress in 11 months. So, I went googling for alternatives. Found two that looks active: [win-get](http://windows-get.sourceforge.net/index.php) and [InstallPad](http://installpad.com/). win-get looks most promising as they actually got a [fairly large repository](http://windows-get.sourceforge.net/listapps.php), but the activity there seems low (for example, [Firefox 2.0 is still not in the main repos](http://windows-get.sourceforge.net/viewrequests.php)). There are also other issues, most notably lack of automatic upgrades to what you already got installed.

So what’s holding back open-source developers from creating a strong apt-get alternative for Windows? Like on Linux, it will require strong governance around the packaging. But that’s perfectly doable. Another problem is that Windows applications are not as easy to install silently as their Linux counterparts. All types of funky <acronym>GUI</acronym> installers exists and judging from the win-get repos there are quite a few that lacks a silent install option. Even so, it is possible to create your own installers that fixes this problem. At work, our sister company [Zipper](http://www.zipper.se/?iLanguageID=2) does exactly this in there commercial [FastTrack](http://www.zipper.se/concept/) and [AppLine](http://www.zipper.se/appline/index.asp)&nbsp;products. FastTrack is apt-get for Windows inside your firewall and works quite well.

And, I really don’t get it why Google released Pack and then just seems to have lost all interest in it. They still have an outstanding possibility of getting open-source applications to the masses, and in a good and controlled fashion. That would certainly be very competitive with Microsoft.

I would be very interested in hearing about additional solutions in the area as I’m sure there a quite a few around that my Google searches has found.

