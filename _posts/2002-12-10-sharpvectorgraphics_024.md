---
layout: post
title: SharpVectorGraphics 0.2.4
date: 2002-12-10 11:26:23.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- SVG
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2002/12/10/sharpvectorgraphics_024/"
---
Last night I uploaded and released [version 0.2.4 of SharpVectorGraphics (SVG#)](http://sourceforge.net/project/showfiles.php?group_id=46621&release_id=127118), an implementation of SVG 1.0/1.1 in .NET. The packages includes support for the SVG DOM, a renderer, SVG picture component for WinForms and a minimal browser. The change log looks like this:

- gzip support (using NZipLib) 
- Re-arranged the path code to make it much simpler to work with 
- Added support for color-interpolation=="linearRGB" on linear gradients 
- Added basic marker support. A clipping bug and some rotation calculation fixes left to do. 
- Added support for elements 
- Handling of external resources for elements improved 
- Generalized and handling 
- Added support for inline SVG images (with the element) 
- Added support for angles in SVG 
- Improved and simplified viewPort and viewBox handling 
- Added SvgWindow as the root object (according the the proposal in SVG 1.2) 
- Fixed gradients bug 
- Fixed so that presentation attributes with !important are ignored (testcase styling-pres-01-t.svg) 
- Added support for locally stored DTDs (LocalDtdXmlUrlResolver.cs) 
- Structured lots of code (added documentation and regions) 
- Improved cache handling (but much more to do) 
- Corrected information in the assembly info 
- Tons of minor fixes
