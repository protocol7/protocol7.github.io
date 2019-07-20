---
layout: post
title: com.googlecode.wmqutils.headers.MQRFH2
date: 2007-10-19 11:52:27.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Messaging/JMS
- MQ
- Open source
meta:
  tags: ''
  openid_comments: a:1:{i:0;s:5:"99429";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/10/19/comgooglecodewmqutilsheadersmqrfh2/"
---
Sometimes, when you're out of luck, you need to use the [old Base Java API for WebSphere MQ](http://publib.boulder.ibm.com/infocenter/wmqv6/v6r0/index.jsp?topic=/com.ibm.mq.csqzak.doc/csqzak10172.htm). That is, not JMS. And you might need to create, or even worse, read a RFH2 header. If this is you, you probably loath the mess that is the RFH2 header structure. It's a mix of a leading binary structure, followed by zero or more almost-XML structures. I have yet to see a [complete specification](http://publib.boulder.ibm.com/infocenter/wmqv6/v6r0/topic/com.ibm.mq.csqzak.doc/csqzak10172.htm).

So, what's a poor hacker to do. I've written up a utility class for [creating](http://code.google.com/p/wmq-util/wiki/CreatingRfh2Header) and [parsing](http://code.google.com/p/wmq-util/wiki/ReadingRfh2Header) RFH2 headers as part of the [wmq-util library](http://code.google.com/p/wmq-util/) that I'm doing at work. The aim is simple: make it easy to use RFH2 headers without any risk of screwing up. Enjoy and report back bugs and suggestions.

Technorati Tags: [wmq](http://technorati.com/tag/wmq), [ibm](http://technorati.com/tag/ibm), [java](http://technorati.com/tag/java), [wmq-util](http://technorati.com/tag/wmq-util)

