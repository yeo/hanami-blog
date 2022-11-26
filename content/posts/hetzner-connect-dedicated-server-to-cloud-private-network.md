---
title: "Hetzner Connect Dedicated Server to Cloud Private Network"
date: 2021-06-29T14:54:52-07:00
draft: true
---

Hetzner dedicated server is very cheap. With $40 per month you can rent
a server with 32G RAM and 8 cores, and 2x 2TB harddrive(so that you can
still setup RAID0).

Hetzner cloud servers and dedicated servers are totally different
product with different webui to manage so it's a bit more complex to
configure.

Traffic inside private network is free and firewall is easiser because you
can whitelist the subnet ip range. Example, with Postgres you can set
10.2.0.0/24 is allowed.


