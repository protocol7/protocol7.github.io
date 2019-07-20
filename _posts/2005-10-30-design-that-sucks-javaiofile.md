---
layout: post
title: Designs that sucks - java.io.File
date: 2005-10-30 23:54:13.000000000 +00:00
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
permalink: "/archives/2005/10/30/design-that-sucks-javaiofile/"
---
[Cameron Purdy blogs on some of the more amazingly bad designs in Java](http://www.jroller.com/page/cpurdy/20051030). While I certainly do not want to steal his thunder, I felt that I need to add my favorite offender to the list, java.io.File. What great minds got their heads together to come up with this crap? And what did they think? "Oh, we got this great C API for working with files, why use any of these new stuff we invented for Java". So, what were we left with?

Now, given that you have created your shiny File object, what would expect to be able to do? Create the actual file, well we got that almost covered. But, even though you have the exact same class for files, directories and links, you have to create them differently (and links, well you can't create those at all) using createNewFile() or mkdir(). And what about that mkdirs(), method overloading anyone?

That was great, now that we got our file, let's move it should we. Okay, we got a renameTo() method that does that for us. But wait, what if the target already exists or we don't have access to move it. Well, we get that useful false returned from the call. Why using those pesky exceptions when you can just return booleans instead?

Alright, lets copy the file. No, that's not supported. Some clever guy must have decided that copying files is such an rare use case that we shouldn't waste one of those methods on that. What else? How about reading the file? Nope. Writing to it? Nope. Well, at least we got a few a pair of methods for deleting the file. [Only if it would work](http://blogs.codehaus.org/people/vmassol/archives/001036_id_love_reusable_ant_tasks.html).

And, as Cameron points out, we got this great class for describing dates. How come get the the last modified time is served as a long? Or why is the getter for the last modified time named lastModified() instead of getLastModified() like the rest of the getters?

Last but not least, we got the outstanding setReadOnly(). This little genious makes the file read-only. How about making the file writable again? Nope, obviously no one would ever need that.

Lucky for us we got the blazingly fast people on [JSR 203](http://www.jcp.org/en/jsr/detail?id=203) working for us.

