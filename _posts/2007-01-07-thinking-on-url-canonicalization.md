---
layout: post
title: Thinking on URL canonicalization
date: 2007-01-07 23:35:24.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- REST
tags:
- Web
meta:
  tags: ''
  openid_comments: a:1:{i:0;s:5:"23774";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/01/07/thinking-on-url-canonicalization/"
---
Over at REST-discuss there's an interesting discussion going on regarding how to construct you URLs in the best way. [Bill Venners](http://www.artima.com/consulting.html) of [Artima](http://www.artima.com) posted a [very interesting note](http://permalink.gmane.org/gmane.comp.web.services.rest/4646) on how he canonicalize all URLs, including the ordering of query parameters and removing default parameters, using redirects. His motivation for doing this, which I think is brilliant, is to [aid search engines in identifying two URLs as pointing to the same resource](http://permalink.gmane.org/gmane.comp.web.services.rest/4672). That is, if [http://example.com/foo?a=1&b=2](http://example.com/foo?a=1&b=2) is his canonical URL, the following examples (with c having the default value of 3) would all get a 301 response pointing to the canonical URL above:

- [http://example.com/foo?b=2&a=1](http://example.com/foo?b=2&a=1)
- [http://example.com/foo?a=1&b=2&c=3](http://example.com/foo?a=1&b=2&c=3)
- [http://example.com/foo?a=1&b=2%20](http://example.com/foo?a=1&b=2%20)

Getting a search engine to figure out that all these are the same thing, would add up the four page rankings and likely make the final page a higher hit. Now, we don't know how search engines do there rankings (or canonicalizations for that matter) but I think it's a fair guess that this method helps along.

In a response, Roy Fielding suggest he should use a canonical URL that doesn't use query parameters at all, probably helping caches to do a better job. I think that makes sense as well, so these suggestions will now form my embryo for a URL c14n best practice:

1. Don't use query parameters in the URL of the final resource (a search result page is a different matter, but the actual final page should have a clean URL)
2. Redirect cases where you need to use query parameters (e.g. when allowing a user to select a resource using&nbsp;for example an HTML form)&nbsp;to the canonical URL.
3. When you really need a page identified by the query parameters (e.g. a search result page), redirect so that ordering and presence of&nbsp;query parameters are canonicalized
