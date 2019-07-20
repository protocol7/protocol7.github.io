---
layout: post
title: W3C has released the next
date: 2002-07-26 10:37:21.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Standards
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2002/07/26/w3c_has_released_the_next/"
---
W3C has released the next working document for DOM3 [Validation](http://www.w3.org/TR/2002/WD-DOM-Level-3-Val-20020725/), [Load and Save](http://www.w3.org/TR/2002/WD-DOM-Level-3-LS-20020725/). I haven't looked that much at the validation part, but the load and save module is really important. Today there are different methods for loading, parsing, serializing and saving XML documents in all browsers. [In IE you have to instansiate MSXML/XMLHTTP, in Mozilla you can use createDocument()](http://www.webfx.nu/dhtml/xmlextras/xmlextras.html), in ASV and Batik there is [getURL/parseXML/postURL/printNode](http://www.protocol7.com/svg-wiki/ow.asp?AdobeSVGViewer). Opera doesn't support it at all. Summary, it's a mess and we need to do something about it. I'm happy this spec is getting there.

