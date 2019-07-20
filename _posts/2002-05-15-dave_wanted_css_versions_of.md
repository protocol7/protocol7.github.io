---
layout: post
title: Dave wanted CSS versions of
date: 2002-05-15 00:36:54.000000000 +00:00
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
permalink: "/archives/2002/05/15/dave_wanted_css_versions_of/"
---
Dave [wanted](http://scriptingnews.userland.com/backissues/2002/05/13#l030ac4c927349b350c1b894439f0cd9e) CSS versions of a page he had done, and learn some CSS. So, I thought I should show him the true powers of XHTML, SVG and CSS combined:  
[My stylesheet](http://www.protocol7.com/lab/scripting_slide/default.asp)  
[Something close to Dave's original page](http://www.protocol7.com/lab/scripting_slide/default.asp?css=daves.css)

The two pages only differs on which stylesheet that is included, the XHTML and SVG is exactly the same.

On the page I added a small SVG image, note that it changes it's look according to the style of the page. In fact, it uses the same stylesheet as the XHTML. I think that this truly shows the benefits of the W3C standards.

The page won't validate on the W3C validator, for two reasons:  
1. embed is not in the XHTML standard, but it's currently the only way to include plugins safely in browsers.  
2. the W3C CSS validator has not been upgraded to support SVG

You need a SVG viewer to see this page, I would recommend the [Adobe SVG Viewer](http://www.adobe.com/svg/viewer/install/main.html).

If you have any suggestions for making this page better, please [e-mail](mailto:niklas@protocol7.com) me.

