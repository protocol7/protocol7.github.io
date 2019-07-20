---
layout: post
title: new Date() JSR
date: 2007-01-30 20:28:51.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Java
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/01/30/new-date-jsr/"
---
It looks like we will finally get [a decent API for working with dates and times in Java](http://jroller.com/page/scolebourne?entry=announcing_jsr_310_date_and). After the debacles with Date (1900-based years anyone?) and Calendar (just how complex can an API be?), [Joda](http://joda-time.sourceforge.net/) has been a savior. Now, a [new JSR](http://jcp.org/en/jsr/detail?id=310) has been registred that aims to start with Joda to create a new, java.time API. Hopefully, the leads can fight to keep this one as simple and logical as possible and fight the [spec-by-committee](http://jcp.org/en/jsr/detail?id=310#1) plague.

