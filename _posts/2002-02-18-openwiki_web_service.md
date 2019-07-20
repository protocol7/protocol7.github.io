---
layout: post
title: openwiki Web Service
date: 2002-02-18 19:13:42.000000000 +00:00
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
permalink: "/archives/2002/02/18/openwiki_web_service/"
---
Uploaded a new [web service](http://www.protocol7.com/services/openwiki.asp) today. It's a API for the SVG-wiki. The methods are the same as in the JSPWiki but I return the data as UTF8 instead of making a base64 encoding of the UTF8 data. That breaks the XMLRPC spec but I think it's a huge bug in the spec and will not follow it. Sorry.

