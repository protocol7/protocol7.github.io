---
layout: post
title: Syncing tweets to Wordpress
date: 2010-04-04 16:33:04.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- backup
- ownyourdata
- twitter
- Wordpress
meta:
  _edit_last: '2'
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2010/04/04/syncing-tweets-to-wordpress/"
---
The way old tweets just go missing worries me. This is [my first tweet](http://twitter.com/protocol7/statuses/55813322), [not available on Google Search](http://www.google.se/search?q=%22Alright,+will+twitter+be+at+all+useful%22) (at least not when writing this post). While my average tweet isn't of much value, over time it builds into something I want to own and have around forever. And I want Google and the others to index it. As usual, this means I want keep it on my own domain. So, I had to set up some form of sync to my [protocol.com domain](http://protocol7.com/). Since I'm a [WordPress](http://wordpress.org/) fanboy, keeping these in WP made sense to me. Turns out, it was simpler than I expected.

Getting my tweets distills down to two methods: getting the archive and continuously getting the new ones.

First, I run [backupify](http://www.backupify.com/) to keep a basic backup of my online stuff, among that, my twitter stream. Highly recommended. backupify keeps my entire Twitter history as an Atom feed. Now, WordPress still does not support importing posts from Atom, so I had to convert the feed into RSS 2.0. A simple XSL-T stylesheet ([available on my GitHub](http://github.com/protocol7/atom2rss)) took care of that. Please note that the stylesheet is purpose-made for this conversion, if you want a generic Atom to RSS 2.0 stylesheet, you might need to be a bit more strict, especially on the date formatting.

So, now I had all my tweets as a RSS 2.0 feed. I could start importing this into WordPress. Turns out the import would die after some hundred tweets (perhaps something with my MySQL settings) but since the importer verifies duplicates, I could simple just rerun the job until all entries was imported.

Then, to get continuos synchronization, I use the [Twitter tools plugin for WordPress](http://wordpress.org/extend/plugins/twitter-tools). It will poll my Twitter stream every 10 minutes and create posts for every new tweet. Works as designed.

![twitter-tools]({{ site.baseurl }}/assets/images/twitter-tools-300x203.png "twitter-tools")

That's it really. I also adapted an [existing Twitter inspired template](http://www.freshpressthemes.com/twitter-wordpress-theme/) for WordPress to be even better for tweets (don't show title, don't show author, permalink post time and so on). And, [here we go, all my tweets](http://protocol7.com/tweets), ready for indexing and saved for posterity. Now all I need to do is to write something useful that is actually worth saving, but that's the easy part right :-)

