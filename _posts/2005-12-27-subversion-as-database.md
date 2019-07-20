---
layout: post
title: Subversion as database
date: 2005-12-27 03:28:18.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Applications
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2005/12/27/subversion-as-database/"
---
After being a heavy subversion user for the last year or more I'm inclined to declare it the perfect tool for storing versioned documents. Of all types of SCMs (e.g CVS, VSS) and document handling systems (e.g. Documentum) I've worked with, SVN is the clear winner due it is very straightforward nature (it's simply a versioned file system) and simple API (RESTish). Excellent clients like [TortoiseSVN](http://tortoisesvn.tigris.org/) and [Subclipse](http://subclipse.tigris.org/) doesn't hurt either. Of course, it doesn't do everything every other system does, especially when compared to the high-end document handlers like Documentu. But then on the other hand, who really needs that functionality? Mostly you just want a safe way of storing your documents in a way where you can browse, retrive, change, revert and possibly audit them. And subversion fits those use cases significantly better than any other tool I have any experience with.

Now, to stretch this a bit further I was thinking of other systems where using subversion as storage might be useful. Especially in systems where you handle versioned document-type data. Two types of applications seems obvious to me: wikis and blogs. In both of these, the primary data is a clob with some metadata (like author and a publishing timestamp). In wikis especially, versioning is crucial due to the nature of multiple, possibly anonymous (or spamming) authors. I bet that basing a wiki around subversion instead of inventing your own RDMS based revision system will be significantly easier and require less coding. And with the native libraries for the popular programming languages (e.g. [Java](http://tmate.org/svn/), [Ruby](http://www.cs.toronto.edu/%7Ejames/svn/ruby_docs.html), .[NET](http://www.softec.st/ClrProjects/wiki/SubversionSharp), [Python](http://pysvn.tigris.org/)), this is bound to get even easier.

I can see one obvious issue, scalability. Subversion is built for a limited number of concurrent users, not what would be expected from a popular wiki or blog. This is an area where the traditional databases excel. However, for cases where you have more readers than writers (as would be expected for a blog or wiki), this can be solved using caching.

As an additional bonus, for applications using their wiki as the main documentation (like [Geronimo](http://opensource2.atlassian.com/confluence/oss/pages/viewpage.action?pageId=1692)), you could cut releases of the online documentation in the same way as you do with the rest of your artifacts, simply by tagging. It would also be easy to incorporate in your standard build process, for example with a wiki storing the text as APT (or other foramts as markdown) you could use Maven to tag, compile your code and build a PDF for the documentation using nothing more than the standard Maven plugins.

Does anyone know of any application built this way? I would be very interested in [feedback](mailto:niklas@protocol7.com) on these ideas.

