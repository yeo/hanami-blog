---
title: "2021-05-17 SMTP Incident"
date: 2021-05-17T14:40:56-07:00
draft: false

categories: ["hanami", "mailwip"]
tags: ["incident"]
---

Between 15:00UTC and 22:00UTC our email forwarding was being slow or
delay. Customers experience slower mail delivery up to 30 minutes.

First of all, we're really sorry for any inconvenience that cause you.
Wheneve you feel uncomfortable, simply login to the dashboard to chat
with  us.

# What happen

Around 15:00UTC, we started to have a spike in our mail requests, a big
customer started to forward thousdand of emails every hour non stop and
cause a network bandwidth spike. Our network started to slow down,
depend on when and how fast the connection between the email sender and
our server, the sender can experience up to 30seconds to see the SMTP
ready banner. Before SMTP ready banner is returned, the sender won't
send email and close the connection due to timeout. Eventually the mail
server on sender side will retry and some of them will be able to go
through.

We reach out to our provider to upgrade our servers to achieve higher
network bandwidth and the incident is fully resolve around 22:00UTC.

# What we do to prevent this

We are going to implement a few things:

- A public status page to help report those errors
- Upgrade our network tier to have higher bandwidth and capacity
