---
layout: post
title: How do you compile your releases?
date: 2006-08-09 23:14:40.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Java
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2006/08/09/how-do-you-compile-your-releases/"
---
When discussing our release builds at work today, I found [this article](http://www.javaworld.com/javaqa/2003-05/02-qa-0523-version-p3.html) which got me thinking. The author argues that you want the latest javac for your compilations, something I agree with. There has been quite a few bugs in the compilers (see my [earlier post on the IBM JDK 1.3 compiler...](http://www.protocol7.com/archives/2006/08/01/ibm-jdk-wonders/)) warranting using the latest and greatest. Also, since the feature set of javac haven't changed that much, you would expect it to have continously improved over time (better test suites would also add to this).

The -target parameter for javac will make it produce Java byte code of the right version. But, if you're not targeting the latest class libraries, you certainly want to catch any problems with using new features (like the classic "new RuntimeException(cause)") during compilation. Now, the author argues for using a new javac and replacing the boot class loader classpath with an old rt.jar.

What do you think? How do you make your release builds? I will play around with the recommendations in the article just to see how it works out. Maven1 seems to support it using the undocumented maven.compile.bootclasspath property. Ant provides the bootclasspath for the [javac task](http://ant.apache.org/manual/CoreTasks/javac.html).

