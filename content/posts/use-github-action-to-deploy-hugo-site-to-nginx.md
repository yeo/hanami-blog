---
title: "Use Github Action to Deploy Hugo Site to Nginx"
date: 2021-02-17T17:40:02-08:00
draft: true
---

I recently setup this blog to share my experience, tips and tricks about
programming.

In this particular post, I want to document how I setup our Hugo site.

# Structure

Being a one-man SaaS, everything at [hanami](https://hanami.run) is very
simple and straight forward. I simply use Nginx to serve static content.

The deployment is simply copy the static file(HTML, CSS), or in other
words, build artifacts to the web server.

In pseudo code, the deployment is literally this:

```
rsync -ravp public/ moon1:nginx-html-dir
```

## Made changes

My wife helps with typo and grammar, she used Github editor to propose
changes as PR. Upon building out PR, the site is pushed to a staging
area for us to view

Upon merging to master, a Github action is trigger.

# Code

With above background, here is what I did.

## Github action.

