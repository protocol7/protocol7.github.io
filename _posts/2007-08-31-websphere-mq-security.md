---
layout: post
title: WebSphere MQ security
date: 2007-08-31 12:39:57.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- MQ
- Security
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/08/31/websphere-mq-security/"
---
With all the recent fuzz on WebSphere MQ security I thought that I should try to collect the current thinking on the best way of securing your WMQ environment.

Lately, [T-Rob](http://permalink.gmane.org/gmane.network.mq.devel/5689) and [Martyn Ruks](http://www.defcon.org/html/defcon-15/dc-15-speakers.html#Ruks) has held two separate presentations on WMQ security and the following posts will reflect a lot of what they presented. This combined with my experiences from securing WMQ environments make up most of the content. I hope to collect feedback from the community to improve over time.

Please note that these posts are my current understanding and should not be regarded as the final answer. I will continue to update these posts as I learn more on the topic. Any feedback is crucial so feel free to comment on any of these posts or send me an email directly. My experience is on the distributed platforms, so you'll find very limited specifics on how to secure your z/OS environment, hopefully the community can help fill these gaps.

Most of the topics listed below are placeholders for future posts I intend to write, and this list will most likely be heavily modified before I'm done.

### How to create a secure WMQ environment

- Why secure?

- Keep up to date

- Policy

- Secure by default

- Securing channels

- Securing queues

- Publish/subscribe

- Triggers and services

- Securing applications

### Breaking in to WMQ

- [Spoofing messages using the dead letter queue](http://protocol7.com/archives/2007/08/17/websphere-mq-message-spoofing-using-the-dead-letter-queue/)

- [Spoofing messages using confirm-on-arrival reports](http://protocol7.com/archives/2007/08/31/websphere-mq-message-spoofing-using-confirm-on-arrival-reports/)

Technorati Tags: [wmq](http://technorati.com/tag/wmq), [websphere](http://technorati.com/tag/websphere), [mq](http://technorati.com/tag/mq), [security](http://technorati.com/tag/security), [ibm](http://technorati.com/tag/ibm)

