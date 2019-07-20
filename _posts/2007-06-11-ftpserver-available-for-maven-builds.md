---
layout: post
title: FtpServer available for Maven builds
date: 2007-06-11 22:52:10.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Apache
- FtpServer
- Open source
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/06/11/ftpserver-available-for-maven-builds/"
---
Starting today, [Apache Incubator FtpServer](http://incubator.apache.org/ftpserver/) JARs are [available](http://people.apache.org/maven-snapshot-repository/org/apache/ftpserver/) from the [Apache snapshot repository](http://people.apache.org/maven-snapshot-repository/). This should make it easy to use FtpServer in your Maven 2 build. Just declare the following dependency and you're done.

`

    <dependency>
      <groupId>org.apache.ftpserver</groupId>
      <artifactId>ftpserver-core</artifactId>
      <version>1.0-incubator-SNAPSHOT</version>
    </dependency>

`

Currently, the snapshots will be deployed manually, but I'm working on getting a CI build up and running that would also deploy snapshots automagically.

