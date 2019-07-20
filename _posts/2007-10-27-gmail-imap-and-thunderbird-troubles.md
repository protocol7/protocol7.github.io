---
layout: post
title: GMail IMAP and Thunderbird troubles
date: 2007-10-27 22:55:50.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- GMail
meta:
  tags: ''
  openid_comments: a:4:{i:0;s:5:"49997";i:1;s:5:"49998";i:2;s:5:"49999";i:3;s:5:"50000";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/10/27/gmail-imap-and-thunderbird-troubles/"
---
I'm trying out the new, much hyped [GMail IMAP support](http://lifehacker.com/software/geek-to-live/turn-thunderbird-into-the-ultimate-gmail-imap-client-314574.php). I added the account to Thunderbird but pretty soon ran into troubles. It seems like Thunderbird has serious issues with folders containing large number of messages. My inbox currently has 65065 messages, which doesn't seem that much. The problem manifest itself by Thunderbird being excessively slow doing anything to any mail in the inbox, some actions (like junking) not working at all. I've also seen Thunderbird using more than 1 Gb of RAM before I had to kill it. If I choose a folder with less messages, like one of the folders based on a GMail label, everything works as expected.

The mouse marker is pretty much pegged in hour-glass mode, still it doesn't seem to use that much CPU.

I've noticed a similar problem before with a POP based folder that stopped working properly as it grew too large. I've googled and searched the [Thunderbird Bugzilla](https://bugzilla.mozilla.org/) without finding anything obvious. Anyone got any suggestion before I add a confused bug report?

