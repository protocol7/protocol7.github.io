---
layout: post
title: Custom SSL factory
date: 2008-05-31 13:01:21.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- ibm
- jms
- ssl
- wmq
meta:
  _edit_last: '2'
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2008/05/31/custom-ssl-factory/"
---
I've been having this code around for a long time but never seemed to get the time to publish it. Some time ago one of my colleagues asked for a similar solution which finally got me cleaning up the code and publishing it.

Lets have a look at the problem at hand. Using SSL sockets with most Java APIs means setting a bunch of system properties, [javax.net.ssl.keyStore](http://java.sun.com/j2se/1.5.0/docs/guide/security/jsse/JSSERefGuide.html#Customization) and friends. Here be dragons. Using the system properties are in most cases a horrible idea. First of all, the JRE implementation is completely silent on any issues found when it tries to use these system properties, for example due to the key store file path being incorrect. Instead, the SSL handshake will fail in wondrous ways. This will in no way tell you what the real problem is unless you dive into the SSL trace logs. And that's not an exercise I would recommend for anyone that doesn't enjoy tedious log files and SSL internals.

In addition, using system properties means the same keystore and truststore must be used for the entire JVM, at least if your application is multithreaded. Want to use different keys for different connections. No can do.

However, some cases the API will allow for providing a custom SSL socket factory. WebSphere MQ is an example of such an API. As described in [this post by Peter Broadhurst](http://hursleyonwmq.wordpress.com/2007/03/08/custom-sslsocketfactory-with-wmq-base-java/), you can quite easily provide such a custom socket factory with the benefit of getting much improved exceptions if anything goes wrong.

So, I took some code I had since before, merged it with Peters code and [got the following](http://wmq-util.googlecode.com/svn/wmq-util/trunk/src/main/java/com/googlecode/wmqutils/ssl/PojoSslSocketFactoryFactory.java). You use it like this.

```
MQQueueConnectionFactory qcf = new MQQueueConnectionFactory();
        qcf.setQueueManager("MYQM");
        qcf.setHostName("localhost");
        qcf.setChannel("SYSTEM.ADMIN.SVRCONN");
        qcf.setSSLCipherSuite(CipherSuite.NULL_SHA);
        qcf.setTransportType(1);
        
        File ks = new File("mykeystore.jks");
        
        // create our factory
        PojoSslSocketFactoryFactory sf = new PojoSslSocketFactoryFactory();
        // setting only the key store means that 
        // it will also be used as the truststore
        sf.setKeyStore(ks);
        sf.setKeyStorePassword("secret");
        
	  // create the socket factory
        qcf.setSSLSocketFactory(sf.createSocketFactory());
        
        Connection conn = qcf.createConnection();
```

Pretty damn easy. And a huge improvement for those who like getting told what's wrong with ones configuration. Using the code above, you can also use different key stores within the same JVM.

The code is available as part of the [wmq-util project](http://wmq-util.googlecode.com), however it is generic and could be used in most applications using SSL sockets where you would normally used the system properties.

Now we can only hope that, for example, IBM starts using something similar in the WMQ Explorer and WMB Toolkit to make SSL issues easier to debug.

If anyone is interested, I also got the code to make it possible to have multiple keys in the same key store and configure the one needed for each connection. I haven't yet integrated it with the above code but if there is any interest I'll do that as well.

