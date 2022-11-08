---
layout: post
title: Moved to Github Pages
date: 2019-07-21 22:04:27.000000000 +00:00
type: post
published: true
status: publish
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2019/07/21/github-pages/"
---

Finally decided to moved this largely deserted blog from my old hosting
provider and a very poorly maintained Wordpress instance. This is now hosted
on a simple Github Pages instance which greatly simplifies things for me. With
the magic of Jekyll, URLs should work as before. There's some broken resources,
but I was too lazy to go through and fix them all.

This move also had the nice side-effect of enforcing HTTPS, as Github Pages
comes with Let's Encrypt integration built in.

To do the migration, I used [this simple Docker
image](https://github.com/protocol7/wordpress-to-jekyll) that does most of the
heavy lifting. I know there are many different options to migrate from
Wordpress, but a liked this one as it offered a great deal of flexibility and
was easy to debug.

As part of this I also cleaned up a bunch of old stuff that was still around on
this domain. Everything is still available
[here](https://github.com/protocol7/protocol7.com) though.

Next up is simplifying my domain management and fully move off my hosting
provider to remove some toil.

Next post coming up in another 8 years :)
