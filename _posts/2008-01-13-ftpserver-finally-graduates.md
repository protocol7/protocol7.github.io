---
layout: post
title: FtpServer finally graduates
date: 2008-01-13 21:05:58.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Apache
- FtpServer
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2008/01/13/ftpserver-finally-graduates/"
---
After way to long time in the [Apache Incubator](http://incubator.apache.org/), one of the open-source projects in which I'm involved, [FtpServer](http://mina.apache.org/ftpserver.html) has finally graduated. Our new home is as a subproject under [Apache MINA](http://mina.apache.org/). MINA, being one of my favorite projects, feels like the perfect home. Ever since I wrote an FtpServer [Listener](http://mina.apache.org/ftpserver-listeners.html) implementation based on MINA, I've been amazed by how well design the API is.   
Since the FtpServer community recently voted to drop our support for Java 1.4, that means we can drop our blocking IO implementation. So, I'm currently in the progress of rewriting our code to make full use of MINA, rather than treating as yet another IO API. Its been great. I've been able to drop a large set of ill-designed classes which should make our code significantly easier to work with.  
Being part of MINA also means that we will be more visible to more developers, something that will hopefully help us build a larger community. The future for the project is looking bright.

Technorati Tags: [mina](http://technorati.com/tag/mina), [ftpserver](http://technorati.com/tag/ftpserver), [apache](http://technorati.com/tag/apache)

