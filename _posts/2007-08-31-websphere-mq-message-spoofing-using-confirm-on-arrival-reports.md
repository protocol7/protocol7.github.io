---
layout: post
title: WebSphere MQ message spoofing using confirm-on-arrival reports
date: 2007-08-31 12:17:37.000000000 +00:00
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
permalink: "/archives/2007/08/31/websphere-mq-message-spoofing-using-confirm-on-arrival-reports/"
---
This post is part of a series I'm doing on [WebSphere MQ security](http://protocol7.com/archives/2007/08/31/websphere-mq-security/).

As described in my previous post of in this series, this method of spoofing messages in WebSphere MQ should be fully attributed to T-Rob, famous from the [WMQ mailing list](http://listserv.meduniwien.ac.at/archives/mqser-l.html) for his deep knowledge of most odd corners in the WMQ world.

The exploit described below does not use any bug in WMQ. WMQ in this case works as documented, this is exploit relies on weakly secured WMQ environments.

As before, I'll update this post as I learn new details around this attack or ways of protecting against it.

### Description

WMQ has a feature called [report messages](http://publib.boulder.ibm.com/infocenter/wmqv6/v6r0/index.jsp?topic=/com.ibm.mq.csqzal.doc/fg10620_.htm). These are usually used by a sending application to get a receipt on whether the sent message has arrived, ended up a exception queue or was expirered. To use it is quite simple. The MQMD header (available in all WMQ messages) contain a Report attribute. Set this to the appropriate value and provide a reply queue and you will get receipts for your sent messages. You can also decide on what you want the report message to contain, either just an empty message, the first 100 bytes or the full data of the original message. In all of these, the report message will have a MsgType (in the MQMD) attribute set to the value Report (4) and a non-zero Feedback attribute (also in the MQMD).

One type of report message is the "confirm on arrival" (COA). This report message is sent by WMQ itself when a message successfully arrives on its target queue. As WMQ sends it, it is put using administrative authority.

This attack could also be done using other report types, like expiration, but COA is the attack the requires the least effort.

Now, if we get access to putting messages on any queue, for example using a hacked application or a badly secured queue manager, we can easily put a spoofed message with a Report attribute requesting a COA with the full message data. We can provide a reply-to queue and reply-to queue manager for any queue in the entire connected WMQ network. Now imagine that this message contains a spoofed message for some application on the WMQ network. An easy and effective attack unless the receiving application knows to defend itself.

![]({{ site.baseurl }}/assets/images/wmq-spoofed-coa.png)

### Protect yourself

There is, as far as I know, no way of shutting of report messages in WMQ. It would be a good addition to WMQ security if we would be able to shut of reports on a queue manager and queue basis.

Sign your messages. Let the sending application digitally sign all messages it send and let the receiving application verify these signatures against known senders. Message with unknown or invalid signatures must be ignored, put on an exception queue and an alert raised.

Receiving applications should verify that they receive an expected message type. Normally, this would be a Datagram or a Request. All other types, and specifically Reports must be ignored, put on an exception queue and an alert raised. In fact, the built-in WMQ command server does this check and will ignore any messages which is not of the Request type. This shows that IBM is well aware of this exploit and are doing these checks themselves. Without this check in the command server, this exploit would have allowed administering WMQ.

If using JMS, here is some example code for how to check the message type:

```
if(!msg.propertyExists("JMS\_IBM\_MsgType") || msg.getIntProperty("JMS\_IBM\_MsgType") == 1 || msg.getIntProperty("JMS\_IBM\_MsgType") == 8) { // do your stuff } else { // run screaming away from this message }
```

Note that if you switch to another JMS provider, this code will still work as it first check for the existence of the specific IBM property.

If your using the Java Base API, this is what you could do:

```
if (message.messageType == MQC.MQMT\_REQUEST || message.messageType == MQC.MQMT\_DATAGRAM) { // do your stuff } else { // run screaming away from this message }
```

Code for most other WMQ API will work similarly to the Java Base example. If you got example code for any of the other APIs, feel free to send it to me and I'll add it to this post.

