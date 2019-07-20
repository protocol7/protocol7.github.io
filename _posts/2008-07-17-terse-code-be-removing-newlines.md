---
layout: post
title: Terse code be removing newlines
date: 2008-07-17 23:01:12.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags:
- Java
- scala
meta:
  _edit_last: '2'
author:
  login: niklas
  email: niklas@protocol7.com
  display_name: Niklas
  first_name: Niklas
  last_name: Gustavsson
permalink: "/archives/2008/07/17/terse-code-be-removing-newlines/"
---
While I'm a big fan of Scala, and in general like to write more stuff in less code, I've seen a few cases of people showing examples of how terse the code gets once its in Scala (or Ruby or what ever) compared to Java. However, in many of those examples, the effect is solely due to using one liner code rather than those, actually readable constructs that code conventions has taught us to use. Not to pick [on this post](http://www.gracelessfailures.com/2008/07/compacting-java-code-and-style.html) in particular (it does in fact mention that they are not satisfied with the result), but it does show my problem. Of course, that Java code could be written like this:

```
Vector v = new Vector();
        for(String s : map.keySet()) if(s.startsWith(prefix) && !s.equals(prefix)) v.add(s);
        return v.size() > 0 ? v.toArray(new String[0]) : null;
```

Is that generics beautiful? Not exactly. Do we have to do a lot of stuff the compile could do for us? Yeah. But I would argue that this code is as readable as the Scala code in the post.

```
(for (val key < - map.keys if key.startsWith(prefix) && (key != prefix)) yield key).toList match {
    case Nil => null
    case list => list.toArray
}
```

Which is to say, not a lot. And it's not significantly more verbose. Now, as [the comment on the post show](http://www.gracelessfailures.com/2008/07/compacting-java-code-and-style.html?showComment=1216274160000#c2987683146900549428), there are better ways of doing this which really does make Scala shine. That's the examples we need.

