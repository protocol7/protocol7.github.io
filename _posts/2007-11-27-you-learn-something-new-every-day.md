---
layout: post
title: You learn something new every day
date: 2007-11-27 17:47:48.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- MQ
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/11/27/you-learn-something-new-every-day/"
---
Looks like [IBM added automatic purging of expired messages on distributed platforms in WebSphere MQ 6.0](http://www-1.ibm.com/support/docview.wss?uid=swg21288579). The [documentation](http://http://publib.boulder.ibm.com/infocenter/wmqv6/v6r0/index.jsp?topic=/com.ibm.mq.csqzak.doc/js01159.htm) seems to fail mentioning this change so I had no clue. This is a great addition as for queues with frequent PUTs and rare GETs (e.g. with a slow or downed receiver), expired messages might build up fast.

The details of how and when the queue manager does the purging is not mentioned, only that you're not guaranteed that it it will purge as fast as you want (which makes sense). Also ,the REFRESH QMGR TYPE(EXPIRY) command available on z/OS is not supported. It would explicitly purge messages on the named (including wild cards) queues. I hope they will get around to doing that as it will be a lot easier then doing GETs on all queues with possible expired messages when you really need to know that messages are purged..

