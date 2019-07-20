---
layout: post
title: WMB init script
date: 2007-10-14 21:23:24.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Applications
- Messaging/JMS
- MQ
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/10/14/wmb-init-script/"
---
For a client, I recently had to install a [WebSphere Message Broker](http://www.ibm.com/software/integration/wbimessagebroker/) on [Suse Linux](http://www.novell.com/products/server/). This also means getting it to start at boot time. Now, as far as I've been able to locate, WMB does not come with a init script. For WebSphere MQ, IBM recently added a [service pac, MSL1](http://www-1.ibm.com/support/docview.wss?rs=171&uid=swg24016554&loc=en_US&cs=utf-8&lang=en), that does exactly this, but so far no luck for WMB. SLES uses [LSB compliant init scripts](http://refspecs.linux-foundation.org/LSB_3.1.0/LSB-Core-generic/LSB-Core-generic/iniscrptact.html), and has a command called [insserv](http://susefaq.sourceforge.net/faq/services.html) which automatically sets up the soft links to make all components start it the right order based on the dependencies you define as metadata in your script. So, with no further ado, here's my current stab at the script:

```
#!/bin/sh ### BEGIN INIT INFO # Provides: wmb # Required-Start: $syslog $network $remote\_fs ibm.com-WebSphere\_MQ # Should-Start: db2 # Required-Stop: $syslog $network # Should-Stop: # Default-Start: 3 5 # Default-Stop: 0 1 2 6 # Short-Description: WebSphere Message Broker # Description: Starts WebSphere Message Broker ### END INIT INFO # Source /etc/rc.status: . /etc/rc.status # Reset status of this service rc\_reset case "$1" in start) echo -n "Starting WMB " su - mqm -c 'mqsistart BRK1D;mqsistart CFGMGRD' # Remember status and be verbose rc\_status -v ;; stop) echo -n "Shutting down WMB " su - mqm -c 'mqsistop BRK1D;mqsistop CFGMGRD' # Remember status and be verbose rc\_status -v ;; try-restart|condrestart) ## Do a restart only if the service was active before. $0 status if test $? = 0; then $0 restart else rc\_reset # Not running is not a failure. fi # Remember status and be quiet rc\_status ;; restart) ## Stop the service and regardless of whether it was ## running or not, start it again. $0 stop $0 start # Remember status and be quiet rc\_status ;; force-reload) $0 try-restart rc\_status ;; reload) rc\_failed 3 rc\_status -v ;; status) echo -n "Checking for service WMB " /sbin/checkproc /opt/ibm/mqsi/6.0/bin/bipservice rc\_status -v ;; \*) echo "Usage: $0 {start|stop|status|try-restart|restart|force-reload|reload}" exit 1 ;; esac rc\_exit
```

Note that the script will start WMB as the mqm user. If this is not what you want, you will have to make your changes at the su commands.

To use, create a file called /etc/init.d/wmb and paste the above content into. Make sure it's runnable with:

```
chmod +x /etc/init.d/wmb
```

The run:

```
insserv wmb
```

And it should set everything nicely for you.

Note that this script is dependent on the WebSphere MQ init script, as provided in the support pac mentioned above. It will also start DB2 beforehand, if available. In my case, we are using DB2, I'm just not happy with the current script I got so I will hold off publishing it until I'm done.

I will be happy to get feedback in the comments on my attempt and will update the code above with any changes.

Technorati Tags: [wmb](http://technorati.com/tag/wmb), [linux](http://technorati.com/tag/linux), [ibm](http://technorati.com/tag/ibm), [suse](http://technorati.com/tag/suse), [sles](http://technorati.com/tag/sles), [lsb](http://technorati.com/tag/lsb), [wmq](http://technorati.com/tag/wmq), [websphere](http://technorati.com/tag/websphere)

