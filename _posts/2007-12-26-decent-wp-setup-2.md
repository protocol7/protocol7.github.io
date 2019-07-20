---
layout: post
title: Decent WP setup
date: 2007-12-26 22:28:57.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- protocol7
- Subversion
- Weblogging
- Wordpress
meta: {}
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2007/12/26/decent-wp-setup-2/"
---
Is this thing on? protocol7 has been broken for a few days due to an upgrade at my hosting and me being lazy over the holidays and not reporting it. Now, the Joyent support has fixed it and we should be back online.

This event reminded me that I needed to revisit my site configuration. I keep the entire site (except for the stuff that MySQL stores for me) in Subversion. The live site is simply a checked out working copy. Whenever I need to make an update, I do that locally on my laptop and commit the change to SVN. Then run a simple `svn up` on my server and it's all done. This setup gives me a lot of confidence in knowing that all changes are safely stored and I can easily retrieve old working versions to rollback any bad update. In this case, this helped me a lot since one of the problems was a file that was mysteriously missing on the live site. `svn up` fixed that immediately.

I've also used the [SVN installation method for Wordpress](http://codex.wordpress.org/Installing/Updating_WordPress_with_Subversion). However, my customizations has been troublesome. Since SVN can not handle overlapping working copies, the files below the WP checkout could not be stored in my SVN. This included my themes and plugins, the files that I spend most time on customizing. No good.

Today I spent some time on fixing this. Please note that I know next to nothing about PHP.

## WP installation

I now include WP automatically in my checkout using the [svn:externals](http://svnbook.red-bean.com/en/1.0/ch07s03.html) property. This means, that wherever I check out the site, SVN will pull down the version of WP I currently run.  
`svn propset svn:externals "wp http://svn.automattic.com/wordpress/tags/2.3.1"`

## Plugins

Plugins are normally kept in wp-content/plugins beneath the WP installation. Again, this means I can not store these in my SVN. However, the plugins directory can be customized by setting the PLUGINDIR variable. Create a directory in your site root `wp-plugins` and put this in your wp-config.php:  
`define('PLUGINDIR', '../wp-plugins'); // no leading slash, no trailing slash`

Then, put all your plugins in wp-plugins and store them in SVN like normal. I pull down any plugin I can using svn:externals, currently Akismet and the OpenID plugin.

## Themes

Themes are normally stored in wp-content/themes. To customize this path, you need to use a different method from plugins. The idea is to use add\_filter to create a filter that changes the path. However, there are currently some issues with this approach (for example image paths in the WP admin GUI not using the filtered paths but instead handcrafting them) so I had to use a workaround. I've created a wp-themes directory in the site root, put my themes in it and stored it in SVN. Then, I create soft links using `ln -s` to link the themes into wp-content/themes. I'll continue investigating this issue with the WP developers to see if a better solution is possible.

## wp-config.php

wp-config.php must be kept under the WP installation directory. Again, I use soft links to keep my original copy in a custom directory and under SVN control. Note that as part of wp-config.php, WP detects its installation directory. When using a soft link, it will find the wrong root directory. Instead, I have changed wp-config.php to set the correct root directory explicitly:  
`define('ABSPATH', '/absolute/path/to/wp/');`

Again, not exactly what you would like, but does the work.

## Site installation

Installing or restoring the site can now be done using the following commands  
`svn checkout http://example.com/my/svn/repos .
ln -s wp-themes/mytheme wp/wp-content/themes/mytheme
ln -s wp-custom/wp-config.php wp/wp-config.php`

Upgrading WP is done by changing the svn:externals property and then running <c>svn up</c>. Dead simple.

Technorati Tags: [wordpress](http://technorati.com/tag/wordpress), [wp](http://technorati.com/tag/wp), [svn](http://technorati.com/tag/svn)

