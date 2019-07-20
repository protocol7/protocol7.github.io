---
layout: post
title: OpenID on protocol7
date: 2006-08-21 19:41:47.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Security
- Weblogging
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2006/08/21/openid-on-protocol7/"
---
I spent last night working on [OpenID](http://openid.net/specs.bml) support for comments on this blog. If you haven't taken a look at OpenID yet, you probably should. OpenID is a truly distributed identification system. By providing a URL, an OpenID consumer can then verify with an OpenID server that you really&nbsp;"are" that URL, the server will also provide you with the possibility of deciding which consumers you want to share your identity with. And, with the addition of the [Simple Registration extension](http://www.openidenabled.com/openid/simple-registration-extension), you can also provide personal details (such as your nickname and email) if you so like.

Since I'm running Wordpress, I started googling for for plugins, finding quite a few different versions. After some messing around, I finally chose [the version provided by Stephan Paul Weber](http://singpolyma-tech.blogspot.com/2006/04/openid-for-wordpress.html), which in turn is based on the work of [Alexander Nikulin](http://the-notebook.org/12/01/2006/openid-comments-for-wordpress/). The changes I've done are miniscular in comparison with the work done by Alexander and Stephan, please give credit where credit is due.

The plugin provides both a consumer for use with post comments and an OpenID server. However, for the server there are multiple free options around the web which are more fully featured so I choose not to use that part of the plugin. Instead, I'm using the excellent service over at [myopenid.com](http://www.myopenid.com). Since the server is hardcoded into the plugin, this meant that I had to start hacking away at the source. And while I was at it I also fixed two other issues I had with it: didn't work with my anti-spam plugin and most of all, didn't support Simple Registration. The latter meant that any comment someone would add would use the OpenID URL for the name, instead of, well, the persons name. Also, it didn't support getting the persons email either. No good. It also had some minor bugs that I really needed to fix.

Two hours later, the plugin now support Simple Registration, so adding a comment will now (granted that your OpenID server support Simple Registration and that you&nbsp;approve of providing this information) automatically retrieve your nickname and email and use those in the comment (of course, email is not actually published on the site).&nbsp;Very simple, very slick. Please try it out and give me feedback on how I can improve it! If your OpenID server does not support Simple Registration, the comment consumer should fall back to your URL. Or, you can still comment by only providing your name, email and site, just like before.

I won't package up and release my version of the plugin just yet since I'm not that confident in that I've made all the necessary changes. Still, if you would like to play around with it, feel free to [email me](mailto:niklas@protocol7.com) or leave a comment on this post and I'll be happy to send it to you.

Next up, see if it's possible to convince the [K2](http://getk2.com/) developers to [include support for the OpenID plugin into the theme](http://code.google.com/p/kaytwo/issues/detail?id=100) like they do for many other plugins. That would be outstanding as it would remove the need for hacking the theme as you have to do today.

