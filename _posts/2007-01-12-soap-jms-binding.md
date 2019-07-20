---
layout: post
title: SOAP JMS binding
date: 2007-01-12 23:28:14.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Messaging/JMS
- Standards
- WS
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/01/12/soap-jms-binding/"
---
Looks like [the big guys finally got their act together](http://mail-archives.apache.org/mod_mbox/ws-axis-dev/200701.mbox/%3c80A43FC052CE3949A327527DCD5D6B27020FB65C@MAIL01.bedford.progress.com%3e) and wrote both a specification for [JMS IRI format](http://mail-archives.apache.org/mod_mbox/ws-axis-dev/200701.mbox/raw/%3C80A43FC052CE3949A327527DCD5D6B27020FB65C@MAIL01.bedford.progress.com%3E/2) and a [SOAP JMS binding](http://mail-archives.apache.org/mod_mbox/ws-axis-dev/200701.mbox/raw/%3C80A43FC052CE3949A327527DCD5D6B27020FB65C@MAIL01.bedford.progress.com%3E/3) ([via Dan Diephouse](http://netzooid.com/blog/2007/01/12/jms-soap-binding-and-iri-scheme-released-from-bea-ibm-sonic-and-tibco/)). Now, I'm certainly not the right person to judge the quality of the SOAP binding, but I do like the fact that there might actually be one soonish.

On the IRI format, its currently only based on using JNDI for identifying the connection factory and destination. However, with JNDI falling out a fashon the last couple of years and JMS commonly running outside the container, I find this a bit lacking. However, the spec leaves some leeway with the following quote:

> JMS relies heavily on JNDI for interoperable functionality (vendor extensions may provide alternate means of acquiring a javax.jms.Destination, but only JNDI is interoperably specified).

That only covers the destination, not the connection factory. I would prefer that the spec more clearly allowed for both JNDI based and a more "freeform" syntax that's up to providers to define. How about:

> jms:jndi://connectionFactoryName/destinationName?params

and (for MQ in this example):

> jms:wmq://queueManagerName/queueOrTopicName?params

[ActiveMQ](http://www.activemq.org/site/tcp-transport-reference.html) and WebSphere MQ&nbsp;already has defined similar URL formats that could be adapted. JMS is inherently not interoperable between different providers anyway, so having these provider specific URLs wouldn't hurt. And it would allow using them without having a JNDI implementation around.

