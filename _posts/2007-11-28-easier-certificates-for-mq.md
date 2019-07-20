---
layout: post
title: Easier certificates for MQ
date: 2007-11-28 22:57:39.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- MQ
- Security
meta:
  tags: ''
  _edit_last: '2'
  openid_comments: a:3:{i:0;s:5:"97516";i:1;s:5:"97533";i:2;s:5:"97553";}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/11/28/easier-certificates-for-mq/"
---
 **Update:** I've posted a [follow up](http://protocol7.com/archives/2008/06/29/basic-constraints-on-websphere-mq-ca-certificate/) to this post with an important addition to the script to create your CA certificate.

* * *

The last couple of days I've been hard at work with setting up SSL for WebSphere MQ for a customer. A major part of that is creating certificates. WMQ uses the IBM security toolkit, GSKit. My previous experience with GSKit is not the best, I've found that it works inconsistently between versions and platforms and contains frequent bugs. Working with this time, the inconsistencies seems to still be there, but at least many of the bugs are now gone. One of the problems is that some GSKits doesn't work with keys/certificates created with the Java keytool which has previously been my weapon of choice (with the [Keystore Explorer GUI](http://www.lazgosoftware.com/kse/)).

Finally giving up on keytool, I retreated to using the GSKit command line tool, gsk7cmd. Working with gsk7cmd is not the most pleasant experience (almost as bad as OpenSSL). Therefore, I've created a set of Linux shell scripts targeted for a streamlined flow for creating certs for WMQ. [They are made available](http://wmq-util.googlecode.com/svn/ssl-scripts/) under the [ASL 2 license](http://www.apache.org/licenses/LICENSE-2.0.html). This is how they work.

Create a directory on some server where you like to create your keys. Copy the scripts to your directory. Edit the scripts to update some generic configuration, currently the DN used and the expiration time for the certificates.

Now start out by running create-ca.sh:

./create-ca.sh mySecretPassword

Make sure you choose a strong password. The command will create a CMS key store containing your CA root certificate. Save it somewhere safe.

Then, for each queue manager (or client), run:

./create-key.sh MyQueueManager mySecretPassword  
or  
./create-key.sh MyClientApplication mySecretPassword

This will create a directory containing a key created for your queue manager. Its certificate will be signed by the CA root key previously created.

If, for some reason you can not create the keys this way, try creating them on the target platform. For example, I failed to get any externally created keys working on iSeries, instead I had to use the DCM tool on the iSeries box. In this case, create the key and export a certificate request (I'll write down the details for doing this on iSeries if anyone is interested). Save the certificate request in your keys directory created at the begining of this howto. Name it \<queue manager name in lower case\>.p10. Run:

./sign-key.sh MyQueueManager mySecretPassword

It will create a certificate response in the file called \<queue manager name in lower case\>.p7r. Import this together with ca\_cert.crt on your target platform.

If your client happens to be a Java client, you need the key store in JKS format. To convert it, run the following command:

./convert-to-java.sh MyQueueManager mySecretPassword

Note that the signing steps does make a huge assumption. A CA must use a unique serial number for each certificate it signs. I didn't want the overhead of keeping track of this. Instead I use a random number for the serial number. This means that if you sign lots of certs with your CA, you might very well get collisions. If you got that many certs, you probably need a better tool :-)

These scripts uses some ideas from [the scripts published by Dale Lane](http://hursleyonwmq.wordpress.com/2007/02/05/an-introduction-to-ssl-configuration/). Thanks! If you want to port these scripts to some other platform, I will happily accept them into SVN. Same goes for bugs and improvements of course.

Technorati Tags: [wmq](http://technorati.com/tag/wmq), [mq](http://technorati.com/tag/mq), [security](http://technorati.com/tag/security), [ssl](http://technorati.com/tag/ssl), [gskit](http://technorati.com/tag/gskit)

