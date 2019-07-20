---
layout: post
title: 'WebRequest/WebResponse for the data: protocol'
date: 2002-12-30 04:04:01.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- ".NET"
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2002/12/30/webrequestwebresponse_for_the_data_protocol/"
---
I just spent an hour to implement a WebRequest/WebResponse pair to handle the data: protocol. You know, that can be used to have your image data inline right in your xlink:href or src attribute. It's a requirement in SVG and useful in many other cases. The protocol is defined in [RFC 2397](http://www.ietf.org/rfc/rfc2397.txt). I will package and release it on protocol7 tomorrow. Now it's really time to go to bed for me.

