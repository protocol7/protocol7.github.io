---
layout: post
title: Introducing Apache Vysper
date: 2011-01-09 23:04:27.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Apache
- Jabber
- vysper
- XMPP
meta:
  _edit_last: '2'
  openid_comments: a:3:{i:0;s:6:"128440";i:1;s:6:"132578";i:2;s:6:"132587";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2011/01/09/introducing-apache-vysper/"
---
![Vysper logo]({{ site.baseurl }}/assets/images/vysper_logo.png) This is the first in a series of posts I'm planning to do on [Apache Vysper](http://mina.apache.org/vysper/). This first post will mostly deal with what Vysper is, later posts will go into details on various ways of using Vysper.

Vysper is an implementation of an [XMPP](http://en.wikipedia.org/wiki/Extensible_Messaging_and_Presence_Protocol) (aka Jabber) server in Java. Vysper is a subproject of Apache MINA and is licensed under Apache License, Version 2.0. Vysper aims to run both standalone as well as embedded into your application. When running embedded, you can closely integrate your application with Vysper, e.g. to share user management or session state. Vysper is still in the early stages, but is certainly usable for early adopters. The currently released version is 0.6, but the example below is based on [SVN trunk](http://svn.apache.org/repos/asf/mina/vysper/trunk/), which will in the near future become 0.7.

XMPP is specified as two RFCs ([RFC 3920](http://www.ietf.org/rfc/rfc3920.txt), [RFC 3921](http://www.ietf.org/rfc/rfc3921.txt) for the core protocol and [a great number of extensions, called XEP:s](http://xmpp.org/extensions/). Vysper implements the RFCs as part of it's server core. For many of the extensions, these are implemented as Vysper modules, meaning as a user, you can choose which modules to have run on your server. For example, some might want to use the [publish-subscribe extension](http://xmpp.org/extensions/xep-0060.html) while others want to use the [multi-user chat](http://xmpp.org/extensions/xep-0045.html) and [service administration](http://xmpp.org/extensions/xep-0133.html) modules. XMPP also supports different network protocols, e.g. the main XML-over-TCP/IP protocol, HTTP long-polling (in XMPP-land called [BOSH](http://xmpp.org/extensions/xep-0206.html)) or [websockets](http://tools.ietf.org/html/draft-moffitt-xmpp-over-websocket-00). Vysper implements these as so called Endpoints. And as with modules, the user can pick and choose which protocols are desired.

For the exact details of which specifications Vysper support, please check this [link](http://mina.apache.org/vysper/standards-support.html).

Configuring Vysper can either be done using the Java API as in the example below, or by using a dependency injection framework. Vysper currently ships with examples for Spring.

Enough theory, let's look at an example. The code below shows the basics of running Vysper from a simple Java application. Afterwards, we'll look into what the code actually does.

To get going, you need to download Vysper, in this case from SVN and build it using Maven (these instructions will be updated when Vysper 0.7 is released). The code below will work on 0.6 with some slight modifications. If building from source sounds intimidating, I've set up this example as [a project on Github](https://github.com/protocol7/vysper-intro), where you can also find archive downloads of the sample with the required dependencies.

```
XMPPServer server = new XMPPServer("vysper.org");  StorageProviderRegistry providerRegistry = new MemoryStorageProviderRegistry();  AccountManagement accountManagement = (AccountManagement) providerRegistry.retrieve(AccountManagement.class);  Entity user = EntityImpl.parseUnchecked("user@vysper.org"); accountManagement.addUser(user, "password");  server.setStorageProviderRegistry(providerRegistry);  server.addEndpoint(new TCPEndpoint());  server.setTLSCertificateInfo(new File("keystore.jks"), "sekrit");  server.start(); System.out.println("Vysper server is running...");  server.addModule(new EntityTimeModule()); server.addModule(new VcardTempModule()); server.addModule(new XmppPingModule()); server.addModule(new PrivateDataModule());
```

Number below refer to code lines in the example above.  
1. Create the server and provide the domain it will be running on. Users at this domain will be addressed as "foo@vysper.org".  
3. Create a storage provide registry. This is a service locator for all the different pieces in Vysper which needs to persist stuff, like users or rosters (the list of friends). In this case, we use the simplest implementation, which stores things in memory.  
5-8. From the above service locator, get the storage provider for users in order to add a user for testing. XMPP uses user identifiers in the form username@domain, similar to mail. These are called entities. Here, you can probably imaging AccountManagement instead being an implementation which looks up users in LDAP or similar.  
10. Set the storage provide registry on the server.  
12. As described above, Vysper uses different types of endpoints for the different network protocols. TCPEndpoint implements the core XMPP protocol as described in RFC 3920. It's required for regular XMPP clients like Adium or Psi to be able to connect to the server. By default, this uses port 5222.  
14. Provide a PKI keystore, this enables the server to use SSL when clients connect and ensures that sensitive stuff (passwords as well as conversations) is kept secret.  
16. Start the server. Vysper is now running and clients will be able to connect to it. You can try it out with your favourite IM client.  
19-22. Here we add modules for some XMPP extensions. Which to use depends largely on the purpose of the server. These must be added after the server is started as they require the server to be fully initiated.

And, that's it. You now hopefully got a working XMPP server running and you can go play with the other neat features it supports. Also, if you have any further questions, feel free to ask on [our mailing list](http://mina.apache.org/vysper/mailing-lists.html) or comment below.

In the next post, I will describe the architecture of Vysper and how messages, called stanzas in XMPP terms, flow through the server.

