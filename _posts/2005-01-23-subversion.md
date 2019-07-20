---
layout: post
title: Subversion
date: 2005-01-23 01:23:06.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Applications
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2005/01/23/subversion/"
---
Today I migrated my personal repository (mostly some documents and a few software projects) from CVS to Subversion 1.0. Installation was very smooth:

1. apt-get install subversion
2. apt-get install libapache2-svn
3. svnadmin create /data/svnroot
4. chown www-data.www-data /data/svnroot
5. htpasswd2 niklas
6. Configure Apache2 to locate the svnroot
7. Done

After that I simply imported a snapshot of the files, I didn't care all that much about the history of the files, but if I did I'm sure that the [migration scripts](http://cvs2svn.tigris.org/) would work just fine.

For lots of more information on making this transfer, see [this writeup](http://www.chiark.greenend.org.uk/~sgtatham/svn.html) by Simon Tatham, the maintainer of Putty.

I'll post some more later after I've been using svn for some time but so far its looking promising.

