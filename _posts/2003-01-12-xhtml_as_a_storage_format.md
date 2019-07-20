---
layout: post
title: XHTML as a storage format
date: 2003-01-12 01:52:18.000000000 +00:00
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
permalink: "/archives/2003/01/12/xhtml_as_a_storage_format/"
---
[Simon Willison argues that XHTML works good as the storage format for your content.](http://simon.incutio.com/archive/2003/01/06/xhtmlIsJustFine#pingbacks "Simon Willison: Archive for 6th January 2003") This is exactly the type of thoughts I had when I decided to re-build protocol7 some time ago. Before, I had a home-made XML format that I used to store all my content. This was then transformed using XSL-T to the HTML on the site. As time had passed, my XML format had grown to handle all my different needs, but what I was doing all along was to build my own copy of XHTML.

So, for the current version of protocol7 I keep all content in XHTML directly. When I need to do site-wide changes I have a XSL-T based tool that I run on all files automatically. Works perfect for me and I would recommend anyone to try it for your static content.

