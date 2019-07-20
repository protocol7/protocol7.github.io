---
layout: post
title: JACL script for context properties
date: 2006-10-24 21:32:20.000000000 +00:00
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
permalink: "/archives/2006/10/24/jacl-script-for-context-properties/"
---
Couldn't find this on Google, so I thought I should post it here. It's a JACL script for creating a [WPM/SIB/JetStream](http://publib.boulder.ibm.com/infocenter/wasinfo/v6r0/index.jsp?topic=/com.ibm.websphere.pmc.express.doc/concepts/cjj0000_.html) JMS alias destination with [the magic context property needed to generate a MQRFH2 header](http://publib.boulder.ibm.com/infocenter/wasinfo/v6r0/index.jsp?topic=/com.ibm.websphere.pmc.express.doc/tasks/tjo0050_.html) when sending messages to MQ.

```
set dest [$AdminTask createSIBDestination "-bus MyBus -type Alias -name MyQueue -node $nodeName -server $serverName -targetBus MyMQBus -targetName MyMQQueue"] 
$AdminConfig create SIBContextInfo $dest { {name _MQRFH2Allowed} {type BOOLEAN} {value true} }
```

