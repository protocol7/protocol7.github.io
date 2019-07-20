---
layout: post
title: MD5 support in FtpServer
date: 2006-09-04 22:08:21.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Apache
- FtpServer
meta:
  cocomment_trackall: ''
  tags: ''
  _edit_last: '2'
  openid_comments: a:1:{i:0;s:5:"70620";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2006/09/04/md5-support-in-ftpserver/"
---
This weekend I checked in support for the [draft-twine-ftpmd5-00](http://www.indyproject.org/Sockets/Blogs/JPeterMugaas/draft-twine-ftpmd5-00.txt) proposal for MD5 support in [Apache Incubator FtpServer](http://incubator.apache.org/ftpserver/). In short, the draft adds two new FTP commands, MD5 and MMD5. Both adds the possibility of requesting the MD5 for one (MD5 command) or multiple (MMD5 command) files. This is an important piece of functionality if you want to do automated transfers over FTP. Using the commands, a client can upload a file and then request the MD5 hash and compare it to the hash of the local file. Similary, it can request the hash of a file to be downloaded to ensure that the file is downloaded without any corruption. All in all a very useful addition to FTP. To bad the draft never seemed to have [gotten anywhere in the standards process](https://datatracker.ietf.org/public/idindex.cgi?command=id_detail&id=8808).

