---
layout: post
title: Subversion troubles
date: 2006-07-23 21:31:54.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Subversion
- Zystems
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2006/07/23/subversion-troubles/"
---
Lately, we've been having some issues with Subversion at work. We use SVN for all things that need versioning, mostly code but also documentation and deployed artefacts. Since we're a fairly small company its not a huge repository (some 45000 total commits, approximatly 150 commits per day). Now, since begining of June some revisions has gone bad resulting in the following error on checkout or update:

> Error REPORT request failed on '/repos/main/!svn/vcc/default'  
> Error REPORT of '/repos/main/!svn/vcc/default': Could not read chunk delimeter:  
> Error Secure connection truncated

"svnadmin verify" outputted the following on examining the affected revision:

> "insn 0 starts beyond the target view position"

After some Googling I found [this write-up](http://ian.blenke.com/subversion/fsfs/corruption/repair/fsfsrepair.html) by Ian C. Blenke, describing the same problem as we see. After some discussion on svn-users and the excellent help by John Szakmeister, his [fsfsverify](http://www.szakmeister.net/blog/?page_id=16) tool now catches and fixes our first broken revision. ~~He is still examining a second broken revision that currently breaks fsfsverify. But, since so far there hasn't been any data corruption seen due to this bug I have high hopes for John being able to create a fix.~~

Update: John has now updated fsfsverify to also catch and fix our second broken revision.  
So, if you're seeing this problem, report it on svn-users, take a backup of your repository and try out John's tool.

