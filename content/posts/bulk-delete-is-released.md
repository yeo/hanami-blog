---
title: "Bulk delete domains is supported now"
date: 2021-06-13T15:37:35-07:00
draft: false

categories: ["hanami"]
tags: ["news", "update"]
---

We're already supported bulk import for users with a lot domains to import domains into our system. But once the domains are expired and our users no longer wish to hold the domains, they have to delete it one by one or use our API to batch delete domains.

We hear and feel the pain, so this week we rolled out a feature to allow simply entering a list of domains to be removed from our system. Once domain per line. A single click and there we go, all unused/expired domains are removed :-).

## Use our dashbord to bulk delete domains

Simply head to **Bulk Import** > **Bulk delete** to start use it. Happy gardening.

Then enter one domain per line to delete it.

![Bulk delete in Mailwip dashboard](/blog/hotlink-ok/bulk-delete1.png "How to
use bulk delete in hanami dashboard")

## Use Rest API to bulk delete domain

If you are a CLI person, you can use our [Rest
API](https://hanami.run/api/#domains) to delete domain by
sending a request like this:


```
curl --request DELETE \
  --url https://api.hanami.run/v1/domains/batch \
  --header 'Content-Type: application/json' \
  --header 'apikey: your-secret-api-key' \
  --data '{
	"domains": [
		"b.com",
		"e.com",
		"f.com"
	]
  }'
```

If you have domains laying around, hook them into hanami to start [forward email](https://mailwip.com) :-).
