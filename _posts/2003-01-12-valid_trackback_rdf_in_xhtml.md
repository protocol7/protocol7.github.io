---
layout: post
title: Valid trackback RDF in XHTML
date: 2003-01-12 02:26:24.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Weblogging
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2003/01/12/valid_trackback_rdf_in_xhtml/"
---
Moveable type can automatically ping other sites that I reference in my posts with their technology called [trackback](http://www.moveabletype.org/trackback/). To do the auto-discovery of the trackback URL [it uses RDF embedded in your HTML.](http://www.movabletype.org/docs/mttrackback.html#autodiscovery%20of%20trackback%20ping%20urls) Now, the problem with this is that you can't just throw in anything in HTML and expect it to validate since RDF elements are totally unknown in the (X)HTML DTDs. One trick around this is to include the RDF as comments, but I think this suck since it makes the whole idea of having markup pretty useless.

So, today I set out to write a DTD that can be used to keep my markup valid and still make it possible to include the RDF tags. So far, [my experiment looks like this. (view source)](http://www.protocol7.com/lab/xhtml_trackback/xhtml_trackback.html). This file validates using XML-Spy and I belive it's valid XML. However, [the W3C validator reports it as non-valid but fails to find any errors.](http://validator.w3.org/check?uri=http%3A%2F%2Fwww.protocol7.com%2Flab%2Fxhtml_trackback%2Fxhtml_trackback.html)

If you find any errors or improvements please [contact me](mailto:niklas@protocol7.com).

After doing this I discovered that [Phil Ringnalda has done a similar experiment.](http://philringnalda.com/archives/002252.php) He also pointed to [this document which calls our methods "eschew validation"](http://infomesh.net/2002/rdfinhtml/#embedNoValidate). When reading this I found that they also proposed [a different method](http://infomesh.net/2002/rdfinhtml/#link), simply using links with a special `rel` attribute. This is a wonderful way of doing it! Won't bloth the (X)HTML and won't require any changes to the DTDs. Lets hope that support for it will be included in future Moveable type versions.

