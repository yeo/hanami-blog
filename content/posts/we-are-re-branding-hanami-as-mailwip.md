---
title: "We are rebranding Hanami as Mailwip"
date: 2021-05-28T12:07:34-08:00
draft: false

author: "Vinh"

categories: ["hanami"]
tags: ["news", "update"]
---

# We're rebranding Hanami as Mailwip

For existing customers, nothing change in your domains or DNS config.

We want to emphasize that **No action is require on your end as an existing customer**. All existing addresses that you have been configuring such as **mx1.hanami.run**,
**mx2.hanami.run**, **spf.hanami.run** and **smtp.hanami.run** will continue to work
forever as they were.

Our public facing website are now [mailwip.com](https://mailwip.com).

On *Nov 26*, when you visit any public facing address with our
*.hanami.run, you will be redirect to mailwip.com. Below is a fulllist
of domain changes.

- homepage: hanami.run -> [mailwip.com](https://mailwip.com)
- dashboard: app.hanami.run -> [app.mailwip.com](https://mailwip.com)
- api: api.hanami.run -> [api.mailwip.com](https://api.mailwip.com)

We will update our documents to switch all reference of hanami.run to mailwip.com. For new customers or new domains, we will instruct you to use the new mx1.mailwip.com, mx2.mailwip.com and spf.mailwip.com

If you want to learn why we’re doing this, read on…

# What happenned?

I started work on Hanami on October 2020. Hanami officially launch in 2021 Jan 25. Before that, we soft launched by mention on social media here and there. Naming is hard, at the time, I really like to watching flowers or left flying in the wind. I think of email forwarding is similar to how the wind blow and make flowers fall. Japanese people doing hanami to watch flower, hence the name.

We have been working hard to build back link, build our reputation. I spend lots of time answer questions on reddit and cloudflare, build our email forwarding plugin on cloudflare.

But unfortunately, it has group call hanamirb.org think that our email forwarding can be confused with their Hanami Mailer library. We’re new and a small company(just one guy doing a DevOps consultancy at getopty.com) and I don’t want to cause any conflict between the two projects. Given that we’re newer than hanamirb.org, I choose to rename my domain to avoid any potential conflict.

In next few months, I’ll start to rebuild our backlink and our branding to reflect mailwip.com

What does Mailwip mean? It’s simply mean Mail+Wip as Work In Progress, which I’m sure we all have it tag as a Github PR somewhere so I think it’s easy to remember, at the same time, It mean as an email forwarding service, we are always working in progress to launch more feature to serve you.

We have been release MFA, API to read email. We’ll soon launch disposable emails and a mobile app to check email easiser in case you don’t want to forward email out and of course.

Thank you for continue to support Mailwip. If you have any questions about this transition, email us as support@mailwip.com

# The future

Name chance is confusing for end users and it may signal that Mailwip
isn't a stable product. For any of Mailwip customers, if you ever
interact with our staff, you know that we're serious and commited to
make email forwarding better and easiser. We'll continue to be here to
serve you. The name chance slow us down a bit, but we will go backup on
our development roadmap eventually. Stay tune with our exiciting
features of CLI and IMAP.

Until next time. At Mailwip, we're always Work-In-Progress.
