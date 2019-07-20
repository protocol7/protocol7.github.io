---
layout: post
title: Building Despotify on Ubuntu
date: 2009-02-24 22:11:16.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- despotify
- Linux
- Music
- spotify
- ubuntu
meta:
  _edit_last: '2'
  openid_comments: a:8:{i:0;s:5:"86755";i:1;s:5:"93683";i:2;s:5:"93685";i:3;s:5:"93691";i:4;s:5:"93785";i:5;s:6:"101061";i:6;s:6:"101227";i:7;s:6:"101368";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2009/02/24/building-despotify-on-ubuntu/"
---
Despotify is out, here's how to build and run it on Ubuntu

```
sudo apt-get install libssl-dev zlib1g-dev libvorbis-dev libpulse-dev libexpat1-dev libncurses5-dev wget http://downloads.sourceforge.net/despotify/despotify-r761.tar.gz?use\_mirror=freefr tar xvf despotify-r761.tar.gz cd despotify-r761/ make ./despotify <your username> </your><your password>
</your>
```

Now enjoy your text based GUI

![Despotify GUI]({{ site.baseurl }}/assets/images/despotify.png "Despotify GUI")

