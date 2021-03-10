---
title: "The Sad State of Domaint TLDs"
date: 2021-02-12T16:00:34-08:00
draft: true

author: Vinh
---

# Launch

I recently launched an email forwarding service. Naming is hard. I usually
get the naming inspiration from Japanese culture. Hanami is an email
forwarding service, its primary job is to fan out emails to destination,
this forms an illusion of flower flying in the wind for me and I decided
to use a funny name, Hanami, which is the Japanese traditional custom
of enjoying the transient beauty of flowers.

However, all of popular domains such as hanami.com, hanami.co and hanami.io
are unavailable. I ended up with hanami.run.

Once the service was running and I got a few customers and emails started to
flow in, I quickly learned a pattern: Spam

# Spam: Build and they will come

One particular thing in email: almost all spam email come from non .com TLD. Specially .cam, .work, .tech, .xyz and myself .run.

When looking at https://www.spamhaus.org/statistics/tlds/ the TLD .run has a bad score of 0.2.

The price of these special domain names are just too cheap becuase they usually have promotion at $1 on first year. And spam usually will be detected very quickly and they don't care about their domain anymore. Imagine me, a small guy, have to accept and process about 1000 spam emails per day from those domains. The system that filters our spam, checks DNS blacklist has to be kicked in.

My temporary solution is I ban all these sensitive domain like .cam, .work..

But at the same time, my service is run on a non traditional TLD: .run. So isn't this a bad act? I think I will figure out a way to deal with spam TLD eventually and have a more effective way to deal with spam instead.

I know a few IT guys and they have come to the same conclusion and they ended up banning a few TLDs entirely such as .xyz or .cam or .work.

I wish the registrars will increase price of domain and force some penalty such as if you bought the domain and bailed out after a year you have to pay some penalty fee.
