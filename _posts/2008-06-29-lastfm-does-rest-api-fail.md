---
layout: post
title: last.fm does REST API, FAIL
date: 2008-06-29 06:55:08.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- last.fm
- REST
meta:
  _edit_last: '2'
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2008/06/29/lastfm-does-rest-api-fail/"
---
last.fm just [launched their brand new API](http://blog.last.fm/2008/06/27/developers-developers-developers) (via [Fredrik](http://sixx.se/nextgen/2008/06/28/lastfm-uppdaterar-sitt-api/)). Sporting support for both XML-RPC and REST. Now that's a first sign of warning. And unsurprisingly it turns out that [the "REST" API](http://www.last.fm/api/rest) is just another RPC over HTTP incarnation.

> For example.:
> 
> ```
> http://ws.audioscrobbler.com/2.0/?method=artist.getSimilar&api_key=xxx...
> ```
> 
> If you are accessing a write service, you will need to submit your request as an HTTP POST request. All POST requests should be made to the root url:
> 
> ```
> http://ws.audioscrobbler.com/2.0/
> ```

WTF? Is it really that hard to get REST? To add insult to injury, they even [managed to make up their own authentication protocol](http://www.last.fm/api/authspec), despite, you know, OpenID and OAuth being [fairly mainstream](http://googledataapis.blogspot.com/2008/06/oauth-for-google-data-apis.html) these days.

