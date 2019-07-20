---
layout: post
title: RPC getting hot again?
date: 2008-07-31 19:55:50.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- etch
- protocol buffers
- rpc
- thrift
meta:
  _edit_last: '2'
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2008/07/31/rpc-getting-hot-again/"
---
Not only did [Cisco](http://www.cio.com/article/print/365513) see the need [in inventing their own RPC protocol](http://steve.vinoski.net/blog/2008/05/22/just-what-we-need-another-rpc-package/), now they become the third major player in a short time to open source it, or [at least that's the aim](http://incubator.markmail.org/search/?q=#query:list%3Aorg.apache.incubator.general+page:1+mid:xwy6azpdwqp2xa25+state:results). The opening of [Facebook's Thrift](http://incubator.apache.org/thrift/) was pretty much quite. But, as with anything touched by todays Midas, Google's [Protocol buffers](http://code.google.com/p/protobuf/) stirred [a](http://steve.vinoski.net/blog/2008/07/11/protocol-buffers-no-big-deal/) [bigger](http://www.innoq.com/blog/st/2008/07/google_can_have_stupid_ideas_t.html) [debate](http://steve.vinoski.net/blog/2008/07/13/protocol-buffers-leaky-rpc/) [on](http://blogs.tedneward.com/2008/07/11/So+You+Say+You+Want+To+Kill+XML.aspx) the merits of RPC.

I think this is an area that merits some further discussion. By now, we've figured out that RPC is a bad fit in heterogeneous, cross-domain integrations. But, in the case you own both ends of the wire and you need some serious throughput and low latency communication, these types of protocols is likely a better fit. At least in the mega environments some of the web companies run these days. It's interesting to follow along with the rapid development of such infrastructure, even though they are out of the hands of most of us. At least for now.

So, with all three combatants now in the open. Let the fight begin.

