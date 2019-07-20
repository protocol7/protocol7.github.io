---
layout: post
title: WAS plugin for Nagios
date: 2009-06-03 22:41:13.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- jms
- monitoring
- nagios
- pmi
- was
- websphere
meta:
  _edit_last: '2'
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2009/06/03/was-plugin-for-nagios/"
---
At one on my current [work](http://callistaenterprise.se/) assignments, we use Nagios (or more specifically, the [OP5 packaged Nagios](http://www.op5.se/op5/produkter/monitor)) for all our infrastructure and application monitoring. We also use a fair amount on WebSphere Application Server instances. Thus, we needed to monitor WAS from Nagios, including some WAS internals like heap size and connection pool sizes. Looking around the Tubes, we failed to find any decent Nagios plugin for WAS, so it turned out I had to write one myself. Since the customer has chosen to open source these types of projects, the code is [now available](http://code.google.com/p/nagios-was/) over at Google Code under an ASL 2.0 license.

The plugin will connect to the WAS JMX interface and uses PMI statistics as the source of data. The API for this is pretty horrible, and based on the lack of discussions around it on the web, I presume not that frequently used. But, at least it provides us with the information we need.

Currently, the plugin support monitoring [JVM heap size](http://code.google.com/p/nagios-was/wiki/MonitorJvmHeapsize), [thread pools](http://code.google.com/p/nagios-was/wiki/MonitorThreadPools), [JDBC connection pools](http://code.google.com/p/nagios-was/wiki/MonitorJdbcConnectionPools) and [live sessions](http://code.google.com/p/nagios-was/wiki/MonitorLiveSessions). Lots of other things could potentially be monitored, but this was what we needed. The plugin also supports [Nagios performance data](http://nagiosplug.sourceforge.net/developer-guidelines.html#AEN201), meaning Nagios will provide pretty graphs for your pleasure. We use this a lot to investigate trends like what happens during traffic peaks, long term application behavior or effects of improvements made in applications.

Getting started is pretty simple, you currently need to download the source code and use Maven to build it into a JAR. You also need to [configure a properties file with information on how to connect to your WAS server](http://code.google.com/p/nagios-was/wiki/InitialConfiguration). After that, it works like any other Nagios plugin.

The plugin has been tested on WAS 6.1 running in non-clustered environments.

If you're interested in improving on the plugin, feel free to [get in touch](mailto:niklas@protocol7.com) and we'll most likely grant you commit rights on the project. There are many areas where the code could be improved as well as extended to support additional stuff to monitor, like JMS connection pools or HTTP response times. Also, support for clustered WAS setups and other WAS versions would be most welcome.

