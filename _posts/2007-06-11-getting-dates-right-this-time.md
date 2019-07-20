---
layout: post
title: Getting dates right this time
date: 2007-06-11 23:12:34.000000000 +00:00
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
permalink: "/archives/2007/06/11/getting-dates-right-this-time/"
---
There's tons of interesting discussions going on the the [JSR-310 dev list](https://jsr-310.dev.java.net/servlets/SummarizeList?listName=dev) right now. It's the JSR for developing the [new(er) date and time API for Java](https://jsr-310.dev.java.net/), based of [Joda Time](http://joda-time.sourceforge.net). The discussions are currently covering two important aspects, the basic design principles for the API and how to handle [non-Gregorian calendars](https://jsr-310.dev.java.net/servlets/ReadMsg?list=dev&msgNo=462). The latter being something that the Calendar API failed at miserably. Not that it didn't support it correctly, just that it did it in such an intrusive way that you quickly get annoyed with it.

The design principles this far looks well thought out:

1. [Immutable](https://jsr-310.dev.java.net/servlets/ReadMsg?list=dev&msgNo=413)
2. [Fluent API](https://jsr-310.dev.java.net/servlets/ReadMsg?list=dev&msgNo=414)
3. [Clear, explicit and expected](https://jsr-310.dev.java.net/servlets/ReadMsg?list=dev&msgNo=423)

I think that setting basic principles like this for your API is a really good idea. As we learn more and more on what the winning principles are, it would be a topic for a book to collect them much like the GoF book. Personally, I think the [XOM principles](http://www.xom.nu/designprinciples.xhtml) (also [covered here](http://www.artima.com/weblogs/viewpost.jsp?thread=142428)) are the best general guideline currently available.

