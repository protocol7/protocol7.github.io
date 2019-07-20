---
layout: post
title: Basic Constraints on WebSphere MQ CA certificates
date: 2008-06-29 21:45:39.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- ca
- certificate
- websphere
- wmq
meta:
  _edit_last: '2'
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2008/06/29/basic-constraints-on-websphere-mq-ca-certificate/"
---
This is a follow-up on my [previous post on creating certificates for WebSphere MQ](http://protocol7.com/archives/2007/11/28/easier-certificates-for-mq/).

In one of my customers environment we began having troubles connecting to SSL secured WMQ channels as we upgraded the WebSphere Message Broker Toolkit to version 6.1. After opening a ticket with IBM and getting quite a few groups within Big Blue involved, it turned out that starting with the IBM Java 1.5 JRE, they have added a validation on Basic Constraints for CA certificates. WMB 6.1 ships with Java 1.5. The scripts I published in my last post does not set this attribute. As far as I've been able to find, there is no workaround besides recreating your CA certificate, which means re-signing all your keys. This annoys me, but given that the requirement for setting the Basic Constraints has been in the RFC [since before dawn](http://www.ietf.org/rfc/rfc3280.txt), the blame is pretty much my own.

> 4.2.1.10&nbsp; Basic Constraints&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
> &nbsp;&nbsp; The basic constraints extension identifies whether the subject of the  
> &nbsp;&nbsp; certificate is a CA and the maximum depth of valid certification&nbsp;&nbsp;&nbsp;&nbsp;  
> &nbsp;&nbsp; paths that include this certificate.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
> The cA boolean indicates whether the certified public key belongs to&nbsp;&nbsp;&nbsp;  
> &nbsp;&nbsp; a CA.&nbsp; If the cA boolean is not asserted, then the keyCertSign bit in  
> &nbsp;&nbsp; the key usage extension MUST NOT be asserted.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
> This extension MUST appear as a critical extension in all CA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
> &nbsp;&nbsp; certificates that contain public keys used to validate digital&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
> &nbsp;&nbsp; signatures on certificates.&nbsp;

Anyways, [the script](http://wmq-util.googlecode.com/svn/ssl-scripts/create-ca.sh) is now updated. [The required change](http://code.google.com/p/wmq-util/source/diff?r=31&format=side&path=/ssl-scripts/create-ca.sh) is to add the argument -ca true when creating the CA certificate.  
If you have any further suggestions to improve the scripts, please contact me and I'll make sure to upgrade them.

