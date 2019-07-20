---
layout: post
title: Filtering WebSphere Message Broker logs on Linux
date: 2009-02-10 22:12:27.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- syslog
- syslog-ng
- websphere
- websphere message broker
- wmb
meta:
  _edit_last: '2'
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2009/02/10/filtering-websphere-message-broker-logs-on-linux/"
---
On Linux/Unix, WebSphere Message Broker uses the [syslog daemon](http://en.wikipedia.org/wiki/Syslog) for its error logging. While arguable the right thing to do, it's a mess having application errors mixed up with kernel messages and what not. However, last week, two guys at work set up a clever solution to this problem, using the powerful [syslog-ng](http://en.wikipedia.org/wiki/Syslog-ng). This is all [Gustav](http://www.linkedin.com/pub/dir/gustav/sinder) and [Christians](http://www.facebook.com/people/Christian_Otback/737285427) work, I merely publish it for others to be able to re-use.

In the syslog configuration file /etc/syslog-ng/syslog-ng.conf.in, add a filter that matches messages from WMB:

```
filter f_wmb { match('^WebSphere Broker'); };
```

This will allow for catching all messages from WMB. Now, create a destination where you want your WMB messages to go:

```
destination wmb { file("/var/log/wmb/messages" group(mqm) perm(0644)); };
```

In this case, we set the group to be mqm, simply because that's the group our developers belong to (yeah, that might be a bad idea, but that's the topic of another post).

Now, connect the destination to the filter:

```
log { source(src); filter(f_wmb); destination(wmb); };
```

With this setup, all messages coming from WMB will end up in the file /var/log/wmb/messages. To keep /var/log/messages clean, we might also want to strip out WMB messages:

```
filter f_messages { not facility(news, mail) and not filter(f_iptables) and not filter(f_wmb); };
```

This line might look slightly different on your OS, however, the general idea is to add the negated f\_wmb filter.

Now, restart the syslog-ng daemon and you should see your WMB message starting to gather in your new file:

```
/etc/init.d/syslog restart
```

In addition to this, we have also set up an Apache HTTPD server to serve up the WMB log file over HTTP, making access to the log trivial for our developers. All in all, I find this very useful. You might also argue that with this knowledge, using the log4j [SyslogAppender](http://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/net/SyslogAppender.html) might be a better idea that our usual RollingFileAppender.

