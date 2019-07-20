---
layout: post
title: A RESTful queue
date: 2007-06-13 22:36:56.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- REST
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
permalink: "/archives/2007/06/13/a-restful-queue/"
---
As messaging and therefore queues is close to my heart, I've been following the [discussions on rest-discuss](http://permalink.gmane.org/gmane.comp.web.services.rest/6149) on how to construct a RESTful queue with great interest. The discussion started (as did my thinking on the topic a year or so back) around how ActiveMQ has choosen to implement [their REST support](http://activemq.apache.org/rest.html), a somewhat broken model as pointed out by Paul Winkler (e.g. non-safe GET, DELETE on queue deletes message rather than the queue).

My favorite model so far is [the one suggested by Steve Bjorg](http://permalink.gmane.org/gmane.comp.web.services.rest/6186), also quite similar to the [one described in HTTPLR](http://www.dehora.net/doc/httplr/draft-httplr-01.html#rfc.section.9). In that case you would push messages onto a queue with POST and pop then with a combination of POST and DELETE. To quote from Steve's email.

> To add an item:  
> POST /queue  
> Content-Type: application/xml (or whatever a queue item is)  
> --\>  
> 201 Created  
> Location: http://server.com/queue/itemXYZ
> 
> To request to pop an item:  
> POST /queue  
> Content-Type: application/w-www-form-urlencoded  
> AckTTL=60 (where AckTTL is the time to acknowledge the queue item or  
> it becomes available again)  
> --\>  
> 200 Ok  
> http://server.com/queue/itemABC
> 
> To delete a popped item:  
> DELETE /queue/itemABC  
> ...

Go read the discussion thread as it contains many interesting aspects on this pretty hard problem. Ideas on how to improve the current suggestions is very welcome.

