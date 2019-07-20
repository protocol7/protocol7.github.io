---
layout: post
title: RemoteMQSC
date: 2004-08-15 23:45:31.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Java
- MQ
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2004/08/15/remotemqsc/"
---
I’ve uploaded the first release of a small project of mine, RemoteMQSC. If you have ever used WebSphere MQ you’ve probably used MQ script and the runmqsc (strmqmmqsc on AS400) command. RemoteMQSC does exactly the same thing but for remote MQ servers. RemoteMQSC runs as a MQ client and sends the script commands as escaped PCF messages.

To run the program, the simplest command is:

java -jar remotemqsc.jar -hostname yourhost

The command requires a host name but can also include the following parameters:

\* -channel SOME.CHANNEL  
 \* -port 1881  
 \* -sslciphersuite SSL\_RSA\_WITH\_NULL\_MD5  
 \* -userID someuser  
 \* -password secret  
 \* -CCSID 850

Note that since I’m not allowed to distribute the IBM JAR files you will have to copy them into the RemoteMQSC directory on your own. The required JARs are:

\* com.ibm.mq.pcf.jar  
 \* com.ibm.mq.jar  
 \* connector.jar

Right now the source code is hosted on my private CVS server so if you want the source code, please send me an email and I’ll send it to you.

