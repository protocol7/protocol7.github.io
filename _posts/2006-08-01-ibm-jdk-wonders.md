---
layout: post
title: IBM JDK wonders
date: 2006-08-01 23:19:00.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Java
- Testing
- Zystems
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2006/08/01/ibm-jdk-wonders/"
---
Last week I had the joy of setting up our [new build server](http://zutubi.com/products/pulse/) at [work](http://www.zystems.se). Since we deal with integrating with legacy applications on god-forbidden platforms, we still need to support JDK 1.3. Since some of these platforms are somewhat weird, this tends to mean IBM JDK 1.3. But we've been sloppy with building on this JDK for some of our projects. Now, when setting up the build server I made sure to include both IBM JDK 1.3 and 1.4 in the available options and also included them for our main projects. They all broke. Not because we were using some fancy stuff in 1.4. No, no, they broke with the wonderful error

> ```
> error: The encoding null is not supported
> ```

Google to the rescue, finds [this page](http://www.bright-green.com/blog/2003_09_22/why_i_drink_coffee.html). Turns out that this train-wreck of a JDK doesn't support non-ASCII characters in the Java source files. Since we're a Swedish company, quite a few people has included @author tags which contains the letters åäö. Lots of search-and-replaces later all of those has been replaced with the harmless a and o. Oh, and someone also made the mistake of including some curly quotes in a comment which had to be replaced.&nbsp; That was boring, but easy. A lot of builds still wouldn't work. That's because some of the i18n unit tests contains strings with funky characters. Had to replace with loading that text from a file. Now everything worked as expected.

Only that some build should instead run on IBM JDK 1.4. These instead produce the equally wonderful

> ```
> error: IO exception sun.io.MalformedInputException
> ```

Gee, thanks. Very helpful this time too. Google again. Found [this page](http://lists.terrasoftsolutions.com/pipermail/yellowdog-general/2005-January/017518.html). This time I had to set the LANG environment variable to make the system not using UTF-8 (which Ubuntu does by default). Luckily, Pulse made this very easy.

Finally all builds worked, a few hours of massaging perfectly fine projects to build on buggy JDKs. An this was still on Linux, not one of the weird platforms. Luckily, JDKs tends to get better with each new version.

