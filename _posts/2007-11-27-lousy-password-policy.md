---
layout: post
title: Lousy password policy
date: 2007-11-27 22:59:29.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Security
meta:
  tags: ''
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/11/27/lousy-password-policy/"
---
Today I received an account for checking my account status for a credit card. On first login I had to change to generated password they sent me to something of my own choice. However, their password policy seems a bit awkward to me. Translated from Swedish:

> The new password must consist of at least 6 characters (a-z and 0-9) and may not have more than two of the same characters in a row. The password must contain at least one digit, but no more than three digits in a row. It must be no longer than 44 characters.

Having these onerous rules leads to two things, both reducing security:

- None of my usual passwords match the rules (usually due to containing characters not oncluded in a-z and 0-9. That means I have to write down this password to have a chance of remembering it. In my case that means [PasswordSafe](http://passwordsafe.sourceforge.net/), but for most people I suspecting it might mean a sticky note, [and probably not in their wallet](http://www.schneier.com/blog/archives/2005/06/write_down_your.html).

- The rules actually reduce the number of possible passwords, leading to easier brute force attacks.

I don't really understand the motivation behind them. If they has at least inhibited the [common passwords people use](http://www.schneier.com/blog/archives/2006/12/realworld_passw.html), but no.

