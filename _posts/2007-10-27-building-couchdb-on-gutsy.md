---
layout: post
title: Building CouchDB on Gutsy
date: 2007-10-27 21:12:01.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- couchdb
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/10/27/building-couchdb-on-gutsy/"
---
![]({{ site.baseurl }}/assets/images/logo1.png) Today I installed a very basic Gutsy box just to try out some stuff. The first thing was to try out the new [CouchDB](http://couchdb.org) features, including their new build system. I used the [instructions by Ciaran Gultnieks](http://blog.ciarang.com/index.php/archives/150) with a few small changes. Worked excellent.

`
sudo apt-get install libicu36 libicu36-dev libreadline5-dev
sudo apt-get install subversion-tools xsltproc automake libtool
sudo apt-get install erlang
svn co http://couchdb.googlecode.com/svn/trunk/ couchdb
cd couchdb
./bootstrap
./configure --with-erlang=/usr/lib/erlang
make
sudo make install
`

As you noticed, the differences are that I needed to install Erlang and Debian/Ubuntu sticks it in /usr/lib/erlang rather than /usr/local/lib/erlang. I also used the latest trunk, not a fixed revision. After building, you start it with:

`
couchdb
`

After which you can connect to CouchDB at [http://localhost:8888](http://localhost:8888) and specifically the new amazing util client at [http://localhost:8888/\_utils/](http://localhost:8888/_utils/). CouchDB is very slick.

