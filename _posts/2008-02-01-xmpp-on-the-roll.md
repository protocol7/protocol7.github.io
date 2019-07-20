---
layout: post
title: XMPP on the roll
date: 2008-02-01 15:36:40.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Jabber
- OSGi
- XMPP
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2008/02/01/xmpp-on-the-roll/"
---
I first wrote this quick introduction to XMPP for [our blog at work](http://wiki.callistaenterprise.se/display/CallistaCom/2008/02/01/XMPP+on+the+roll), I'm publishing this copy over here to keep my useful posts in one place. Expect to find more posts on OSGi and XMPP here in the future.

[XMPP](http://www.xmpp.org/), aka Jabber, is making great strides into the world of instant messaging. Since [Jeremie Miller](http://www.jeremie.com/blog/) released the first version in 1998, it has been the obvious alternative for those preferring open protocols over the proprietary networks pushed by ICQ, AOL, MSN and others. With big guys like [Apple](http://www.apple.com/se/server/macosx/features/ichat.html) and [Google](http://code.google.com/apis/talk/open_communications.html) using XMPP it began making noise in the corporate world. Now, with AOL (one of the biggest IM network provider) [looking at XMPP](http://florianjensen.com/2008/01/17/aol-adopting-xmpp-aka-jabber/), the road to world dominance seems clear ahead.

So what's in it for us, the application developers? One example is keeping an eye on our applications. XMPP provides two perfectly fitting concepts:  
\* Presence - what modules are up and running  
\* Messages - communicate with your application

Let's have a look at a simple example. Note this is a demo code, quality code might use things like clever things like exception handling and external configuration. But for now, this will do.

First of all, you need two Jabber/GTalk accounts. Go [create them](http://www.jabber.org/user/userguide/#register) (if you don't already have a few), make sure they are buddies and get back here... back already? That was fast.

Now, let's write a simple [OSGi](http://www.osgi.org/) bundle that sends its presence based on the state in its life cycle. Feel free to imagining how this would work with Spring or EJB life cycle if that's tickles you more. OSGi has what is called a [BundleActivator](http://www2.osgi.org/javadoc/r4/org/osgi/framework/BundleActivator.html) that keeps track of when a bundle is started and stopped (that's InitializingBean and DisposableBean for all of you in Spring land). Let's create an implementation.

```
import org.osgi.framework.BundleActivator;
```

Choose one of many XMPP clients available in Java. One of the easier is the [Smack client](http://www.igniterealtime.org/projects/smack/index.jsp) from Jive^H^H^H^H Ignite Realtime, also available for [all your Maven needs](http://www.mvnrepository.com/artifact/jivesoftware/smack). Let's create and connect one when our BundleActivator is created:

```
import org.jivesoftware.smack.ConnectionConfiguration;
```

I did tell you this is demo-quality code, right. If this were production code you would certainly want to inject that connection into your code rather than hard coding it. Fine, now, let's show when the bundle goes active or is stopped by indicating our presence:

```
import org.jivesoftware.smack.ConnectionConfiguration;
```

We're almost done. Why not get a message that tells us that the bundle has started and all is good. This is the complete code listing:

```
import org.jivesoftware.smack.ConnectionConfiguration;
```

We're done with coding. An OSGi bundle requires some extra attributes in the manifest but I won't describe them in any detail here, go read any of the [OSGi tutorials](http://www.google.se/search?q=osgi+tutorial) or the [surprisingly readable specification](http://www2.osgi.org/Download/Release4V40) if you want to understand them.

```
Bundle-Version: 1.0
```

Now package all of that into a JAR, including the Smack JAR, and fire up your favorite OSGi implementation. You do have a a favorite one, right?

For me, that means the [Apache Felix](http://felix.apache.org/) [shell](http://felix.apache.org/site/apache-felix-usage-documentation.html):

```
$ java -jar bin/felix.jar
```

Start the bundle by running "start 4" and you should see the Jabber user getting online and get a message saying that everything is okay. Stop it with "stop 4" and you should get a message and see it go offline. Imagining having that with all your components and not having to depend on that monitoring system or wading through log files.

```
-\> install file:///path/to/project/xmpp-bundle-1.0.jar
```

For all you OSGi geeks, have a go at wrapping this code into a service that all your bundles can use. That's what I do.

Seems useful? Got any ideas as to where you could use XMPP communicating with you?

Technorati Tags: [xmpp](http://technorati.com/tag/xmpp), [osgi](http://technorati.com/tag/osgi), [im](http://technorati.com/tag/im), [java](http://technorati.com/tag/java)
