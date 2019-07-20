---
layout: post
title: Even easier WP upgrades
date: 2007-10-27 11:56:25.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- protocol7
- Subversion
- Weblogging
meta:
  tags: ''
  openid_comments: a:6:{i:0;s:5:"49960";i:1;s:5:"49961";i:2;s:5:"49962";i:3;s:5:"49963";i:4;s:5:"49982";i:5;s:5:"49983";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/10/27/even-easier-wp-upgrades/"
---
I just upgraded my Wordpress installation (the one used to publish this post) to the latest [2.3.1](http://wordpress.org/development/2007/10/wordpress-231/). Upgrading WP is easy, but boring so this time I decided on putting some additional work into the upgrade by switching to the SVN based install [described here](http://codex.wordpress.org/Installing/Updating_WordPress_with_Subversion). Worked like a charm and future updates should now be as easy as running `svn switch`. I keep the rest of my site in my private SVN since a few years back. That means I would like to keep my WP customizations (like wp-config.php, plugins and themes) in my own SVN and then interleave their working copies to make up the final site. Haven't yet figured out how to best do this. Tried soft linking my custom files into the WP checkout, but that blew up WP.

