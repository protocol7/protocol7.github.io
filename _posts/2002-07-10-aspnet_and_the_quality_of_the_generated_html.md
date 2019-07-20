---
layout: post
title: ASP.NET and the quality of the generated HTML
date: 2002-07-10 12:25:31.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- HTML/XHTML
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2002/07/10/aspnet_and_the_quality_of_the_generated_html/"
---
Been playing some with the ASP.NET web forms in Visual Studio.NET lately and I find the quality of the HTML generated from them terrible. I would expect it to, at least, produce valid XHTML (without breaking IE 5.0 support). It just seems that Microsoft were sloppy when building the HTML generator. For example, why are some empty tags closed and some are not?

And I don't think that, for example:

- use a doctype that triggers standards compliance mode in IE6 
- use consistent lower-case styles
- not sticking MS specific attributes (that not even IE uses) on tags 
- automatically putting all styles in a CSS instead of inline 

are to much to ask for.

If anyone is working on subclassing the web forms to produce better output or have another solution, please [tell me](mailto:niklas@protocol7.com) and I might actually find web forms okay to use some day :-)

