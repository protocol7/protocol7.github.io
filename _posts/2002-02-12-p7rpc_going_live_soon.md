---
layout: post
title: p7.rpc going live soon
date: 2002-02-12 18:59:15.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Uncategorized
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2002/02/12/p7rpc_going_live_soon/"
---
Since I love the idea of web services I would like to really get it started. And I don't think that you as a developer should really have to care if you're using SOAP or XMLRPC to do the communication. Therefore, the last couple of days I've been working on a library that basically does two things:

1. Makes it very simple to create web services from your new or existing ASP functions. Just include a file and make two calls and you got a web services that will respond to both SOAP and XMLRPC calls. It will also automatically provide some basic documentation for your web service in the same way as .Net does.

2. Make it just as easy calling any web service with SOAP or XMLRPC from your browser.

I will upload the code with documentation later today or tomorrow. This first version is a little bit limited (especially on the SOAP implementation and error handling) but can do the basic stuff.

