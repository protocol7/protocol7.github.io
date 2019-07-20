---
layout: post
title: Schema association
date: 2007-03-25 16:50:51.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- XML
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/03/25/schema-association/"
---
Does your XML editor do this?

[![Oxygen screenshot]({{ site.baseurl }}/assets/images/oxygen-assoc.thumbnail.png)](http://protocol7.com/wp-content/uploads/2007/03/oxygen-assoc.png "Oxygen screenshot")

If not, you should really have a look at [Oxygen](http://www.oxygenxml.com/) or some other editor that allows you to bind your RNG, XSD or DTD schemas to your XML documents using namespaces, root element names or file names. That way, we can all get rid of those useless xsi:schemaLocation for good and rather let the user of the document decide on what schema to use and where it's located.

