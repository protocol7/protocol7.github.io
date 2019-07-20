---
layout: post
title: commons-net 2.0 released at last
date: 2008-11-01 22:47:12.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Apache
- commons-net
- FtpServer
meta:
  _edit_last: '2'
  openid_comments: a:1:{i:0;s:5:"97771";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2008/11/01/commons-net-20-released-at-last-6/"
---
After a long time, [commons-net 2.0](http://commons.apache.org/net/) has [finally been released](http://markmail.org/message/suic73mskg6agn7m). It is now also available in the [central Maven repo](http://repo1.maven.org/maven2/commons-net/commons-net/2.0/). While there are many changes and general clean ups in the release, the big news for me is the support for FTPS. That's a feature we use a lot in the unit testing of [Apache FtpServer](http://mina.apache.org/ftpserver/) so now having commons-net release rather than as a snapshot should make life easier.  
Now, countdown to getting [1.0-M4](https://issues.apache.org/jira/browse/FTPSERVER/fixforversion/12313395) of FtpServer released has started. Still got some bugs to fix.

