---
layout: post
title: AMQP now public
date: 2006-06-20 20:59:36.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Messaging/JMS
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2006/06/20/amqp-now-public/"
---
The AMQP protocol, which I wrote a [little piece](http://www.protocol7.com/archives/2005/02/24/amq/) on some 18 months ago, has been [published](http://www.twiststandards.org/tiki-download_file.php?fileId=226). See [this write-up](http://www.infoq.com/news/amq#view_977) over at InfoQ for a description. I strongly support the idea of commoditizing a messaging protocol so that messaging providers (e.g. WebSphere MQ, ActiveMQ, Tibco RV) will get fully interoperable. In this area, HTTP should serve as the golden standard. As someone who spends a considerable amount of my time in the world of messaging, I find the abundance of propriatary protocols in this area a poor state.

For AMQP to become a truly establized standard here I think that the AMQ organization should aim for IETF. The current set of authors is sorely missing all the major messaging software developers (e.g. IBM, Tibco and Sonic) which would be required for success. IETF can be strong enough to get a standard like this well-known enough to force even IBM (the clear market leader) into supporting it.

I have yet to deeply study the published spec (still on vacation), but from a quick scan it looks mature and well prepared. Since it's all about interoperability, I'm happy to find a conformance test suite mentioned in the last chapter.

