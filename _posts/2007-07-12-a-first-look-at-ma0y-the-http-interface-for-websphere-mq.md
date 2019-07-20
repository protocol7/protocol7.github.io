---
layout: post
title: A first look at MA0Y, the HTTP interface for WebSphere MQ
date: 2007-07-12 21:45:36.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- REST
tags:
- MQ
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/07/12/a-first-look-at-ma0y-the-http-interface-for-websphere-mq/"
---
As has already been [reported](http://hursleyonwmq.wordpress.com/2007/07/05/new-websphere-mq-http-support/) in [several](http://de9644.wordpress.com/2007/07/12/ibm-websphere-mq-bridge-for-http-ma0y-tested/) [blogs](http://marten.gustafson.pp.se/blog/2007/07/03/wmq-http-bridge/), IBM has released a [new supportpac](http://www-1.ibm.com/support/docview.wss?uid=swg24016142) for exposing [WebSphere MQ](http://www.ibm.com/software/integration/wmq/) queues and topics as HTTP resources. The supportpac aims at being RESTful, at least that's what you are lead to believe from the banner on the main WMQ site.  
 ![]({{ site.baseurl }}/assets/images/http_bridge_logo.jpg)

However, much like the [ActiveMQ REST support](http://activemq.apache.org/rest.html), the RESTfulness, or even basic HTTP compliance does have it's rough edges.

The supportpac exposes a queue on a URL looking like http://example.com/wmq/msg/queue/FOO. On this resource, three basic operations is allowed:

- POST: will push a new message to the queue
- GET: will peek at the first message from the queue
- DELETE: will pop the first message from the queue

Now, there are several problems here. For example, the GET and DELETE is done at the queue URL, but actually works on a different resource, the message. The way the DELETE is done, the expectation would be to remove the queue itself. And the GET should return some representation of the queue, such as a listing of the available messages. On top of this, [DELETE must be idempotent](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.1.2), however in this case, doing multiple DELETEs will result in very different results (different messages being read). In addition, re-doing a failed DELETE (for example due to being in-doubt because of a network failure) could lead to multiple messages being lost (note that IBM makes it clear that this is the case).

All that being said, as been shown on [rest-discuss lately](http://permalink.gmane.org/gmane.comp.web.services.rest/6149), designing a queue with the standard HTTP methods is not entirely straight-forward and might lead to a both complex and odd (from a queuing perspective) API. Adding simplicity in the mix, and not supporting assured delivery, the design chosen in the WMQ supportpac might be understandable.

Besides the issues above, I think a big improvement to the API would be if it supported resource discovery. The examples below describe this, in addition to suggesting a better design for pushing, peeking and popping messages:

- http://example.com/wmq returning a list of the available queue managers
- http://example.com/wmq/myqm returning a list of the available destinations on that specific queue manager. 
- As discussed above, the http://example.com/wmq/myqm/queue/FOO resource should return a list of available messages on that specific destination. This resource also supports the POST as described above.
- http://example.com/wmq/myqm/queue/FOO/nextmsg redirecting to the first message of the queue
- http://example.com/wmq/myqm/queue/FOO/123456789 identifying a specific message and supports the GET and DELETE requests as described above.

In [a comment](http://protocol7.com/archives/2007/06/13/a-restful-queue/#comment-43423) on an [earlier post here](http://protocol7.com/archives/2007/06/13/a-restful-queue/), James Strachan of ActiveMQ notes that he would like to design a fully RESTful API for ActiveMQ. Maybe that could be a chance to dive deeper into this interesting area.

As noted on the [Hursley WMQ blog](http://hursleyonwmq.wordpress.com/2007/07/05/new-websphere-mq-http-support/), IBM is looking for feedback on the code, so hopefully some of these issues could be taken care of.

