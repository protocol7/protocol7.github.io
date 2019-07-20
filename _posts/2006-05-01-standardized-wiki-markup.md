---
layout: post
title: Standardized wiki markup
date: 2006-05-01 23:28:09.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Standards
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2006/05/01/standardized-wiki-markup/"
---
Migrating from one wiki software to another is a pain. A few years back I migrated the [SVG wiki](http://wiki.svg.org/Main_Page) from [OpenWiki](http://openwiki.com/) to [PhpWiki](http://phpwiki.sourceforge.net/) (and since then it's been migrated again, to [MediaWiki](http://www.mediawiki.org/wiki/MediaWiki)). This was, a lot of really boring copy-paste work. Then again, a year ago I migrated our internal wiki at work from [MoinMoin](http://moinmoin.wikiwikiweb.de/) to [Confluence](http://www.atlassian.com/wiki/?clicked=footer). Again, boring, tedious work. All of this because different implementations can't agree on the basic syntax for marking up stuff like headers, tables and bold text. Common, how hard can it be. There are already [some](http://www.textism.com/tools/textile/) [attempts](http://www.xmlmind.com/aptconvert.html) for a common markup out there. Can't you just agree on one?

I agree with [Jason Sankey](http://www.alittlemadness.com/?p=6) that standardizing on one-shall-rule-them-all wiki syntax would be great, can it be done? In the meantime, maybe one should write an any-to-any wiki syntax converter. By using a common syntax/object model one could easily plug in additional syntaxes as they (undoubtably) come along. Anyone know of such a project already?

