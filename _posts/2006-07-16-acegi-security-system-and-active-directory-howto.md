---
layout: post
title: Acegi Security System and Active Directory howto
date: 2006-07-16 18:24:10.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Java
- Open source
- Security
- Spring
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2006/07/16/acegi-security-system-and-active-directory-howto/"
---
At work, I'm finishing up an application that uses [Acegi Security System](http://acegisecurity.org) for authentication and authorization. Last week, I had to create an example configuration that used Active Directory for verifying users and assigning them roles that would allow them into the application. Now, this is probably pretty easy if you know Acegi and LDAP, but since I'm pretty poor at both of them it took me half a day. To save your time (should you be as ignorant as I am), here's how I did it.

I should point out that below I use Acegi as the name of Acegi Security System. This is not recommended but I though that it's a least better then ASS ;-)

To start with, my requirements was that I wanted to use the mail alias (in my case niklas.gustavsson) as the login name, not the CN. In our AD (and most others I presume) this is stored in the mailNickname attribute. If you like to use the sAMAccountName it will work the same way, just replace mailNickname.  
Second, I wanted users from three different groups (our three offices) to have access.

The main Acegi file is pretty much the boilerplate config from the "Tutorial Sample" so I won't go into very much depth on that here. What we need in addition to that files, is a working AuthenticationProvider that can be plugged in. For LDAP, there is LdapAuthenticationProvider. The provider needs two things, an Authenticator and an AuthoritiesPopulator.

### The Authenticator

For authenticator there are two options, [BindAuthenticator](http://acegisecurity.org/docbook/acegi.html#ldap-ldap-authenticators-bind) that will try to bind (login) to the LDAP server as the user and [PasswordComparisonAuthenticator](http://acegisecurity.org/docbook/acegi.html#ldap-ldap-authenticators-password) that will use the LDAP compare function to verify the provided password with that stored in LDAP. I went for BindAuthenticator, can't really say if this decision makes any difference but it worked for me.

The BindAuthenticator needs the connection details for the LDAP server, provided by a Context, in Acegi a DefaultInitialDirContextFactory. Here you just provide the URL to your server (e.g. ldap://ad.example.com), the DN for the user you want to use for lookups, this needs to be a full DN, and the password for that user. In their example, Acegi includes a BaseDN in the server URL, this did not work for me and my config only started working after removing it.

`
<bean id="initialDirContextFactory"
class="org.acegisecurity.ldap.DefaultInitialDirContextFactory">
<constructor-arg value="ldap://ad.example.com"/>
<property name="managerDn">
<value>CN=queryuser,CN=Users,DC=example,DC=com</value>
</property>
<property name="managerPassword">
<value>secret</value>
</property>
</bean>
`

Now, here comes the first tricky part. The example in the Acegi documentation uses the userDnPatterns property on BindAuthenticator to perform the bind. Now, I was only able to get this working when logging in using my CN (Niklas Gustavsson) but since I wanted to use the mailNickname I was stuck here. Instead I had to use the filter search capabilities (did I say that Acegi is a marvel of flexibility with the price of complexity?). Here is my understanding of how this works.

1. Instead of binding directly, Acegi uses the filter to find a matching user
2. If no user is found, that's a failure.
3. If a user is found, takes that users DN and tries to bind using it
4. Success to bind means that we are okay, failure means incorrect password

So, we need to set up a filter search. This is done using a FilterBasedLdapUserSearch with the following constructor arguments:

- The BaseDN for the search, for example OU=Users,DC=example,DC=com
- The filter statement
- The context factory

I also provided a property to enable search on any sublevel, leaving the following configuration:  
`
<bean id="userSearch" class="org.acegisecurity.ldap.search.FilterBasedLdapUserSearch">
<constructor-arg index="0">
<value>OU=Users,DC=example,DC=com</value>
</constructor-arg>
<constructor-arg index="1">
<value>(mailNickname={0})</value>
</constructor-arg>
<constructor-arg index="2">
<ref local="initialDirContextFactory"/>
</constructor-arg>
<property name="searchSubtree">
<value>true</value>
</property>
</bean>
`

Now we're ready to wire up the BindAuthenticator providing the context factory as a constructor argument and the filter search as the userSearch property:  
`
<bean class="org.acegisecurity.providers.ldap.authenticator.BindAuthenticator">
<constructor-arg>
<ref local="initialDirContextFactory"/>
</constructor-arg>
<property name="userSearch" ref="userSearch"/>
</bean>
`

### The AuthoritiesPopulator

Now, with the user authenticated we need to assign it a role that will allow access to the application. The simplest way to do this is with the DefaultLdapAuthoritiesPopulator. This class will populate the user with a set of roles based on the groups of which its a member. By default it will prefix the role name with "ROLE\_" and uppercase the group name. So, a user which is a member of "MyAppUsers" and "MyAppAdmins" will get the roles ROLE\_MYAPPUSERS and ROLE\_MYAPPADMINS. Good enough, but how do we configure the populator? First we need the BaseDN for groups (e.g. CN=GroupsDC=example,DC=com) and second the attribute that you want to use for the role name, in our case "cn". The configuration would then look like this:  
`
<bean class="org.acegisecurity.providers.ldap.populator.DefaultLdapAuthoritiesPopulator">
<constructor-arg>
<ref local="initialDirContextFactory"/>
</constructor-arg>
<constructor-arg>
<value>CN=Groups,DC=example,DC=com</value>
</constructor-arg>
<property name="groupRoleAttribute">
<value>cn</value>
</property>
</bean>
`

What will happen is that Acegi will search this BaseDN for groups of which our user is listed in the "member" attribute. After that, it will take the CN of those groups, prefix, uppercase and assign as roles to the authenticated user.

Now all you need to do is to configure a LdapAuthenticationProvider with the BindAuthenticator as the first constructor argument and the DefaultLdapAuthoritiesPopulator as the last.

The full example configuration can be downloaded [here](http://protocol7.com/code/acegi-ldap/applicationContext-acegi-security-ldap.xml).

### The objectDefinitionSource

Last but not least, we need to configure the objectDefinitionSource in the boilerplate file from the tutorial sample to allow users with the correct roles to log in.

`
<property name="objectDefinitionSource">
<value>
CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
PATTERN_TYPE_APACHE_ANT
/login=IS_AUTHENTICATED_ANONYMOUSLY
/**=ROLE_MYAPPUSERS
</value>
</property>
`

Here we set the role ROLE\_MYAPPUSERS should be allowed to access any URL of the application. We make one exception for the login page which any (unauthenticated) user can access, otherwise it would be impossible to log in.

### Summary

That's all you need to talk to an Active Directory and given Acegi's flexibility you can pretty much bend this configuration any way you want to fit your needs.

I should point out that the possibility to set up all the beans in a simple TestCase instead of having to redeploy and test the web application made trying this out much faster. It also meant that I could try each part (e.g. the FilterBasedLdapUserSearch) in isolation.

Also, the power of Acegi is astounding. Given some (usually quite complex) configuration, it can be tweaked to perform authentication and authorization in pretty much any way imaginable. Very impressive and a great addition to Spring. Hopefully the new configuration support in Spring 2.0 will simplify the XML, I haven't yet had the possibility to play with it.

Ah, glad to get that of my chest. Feedback, improvements are of course welcome!

