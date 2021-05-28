---
title: "The Quirks of Gmail Ui"
date: 2021-03-09T00:55:56-08:00
draft: false

author: Vinh

tags: ["hanami", "email forwarding"]
categories: ["dev"]
series: ["Tale of email"]
---

# A Tale of DKIM signed email

I run a [mailwip(former hanami)](https://mailwip.com), an email forwarding service and
I have a few stories about email that I want to share. Today I want to
talk about Gmail.

Gmail is a big player in email world. It dominates small and medium startups.
All of companies that I worked for has been using gmail. Even mailgun or postmarkapp use gmail.
Gmail is no doubt really great. Their spam filters work better than Microsoft or Outlook from what I can observe. However, gmail UI has some strange UI decision. Today I want to tell a story about the "Via" badge.

First, we'll have a look at these two screenshots

### How A1 appears on gmail

![A1](/blog/pic/tale-email-a1.png)

### How B1 on gmail

![B1](/blog/pic/tale-email-b1.png)

Which one looks more trustworthy? Obviously A1 looks better. B1 has a suspicious text "via way.hanami.run".

Now looks at these two screen shot? Which one looks more trust worthy.

### A2 is original source of A1 email

![A2](/blog/pic/tale-email-a2.png)

### B2 is original source of B1 email


![B2](/blog/pic/tale-email-b2.png)

B2 is definetely better here, SPF is passed, DKIM is valid.

___

# The end

Now did you know that the A2 is the header of A1 email. Somehow when we signed a message with DKIM, google decided to show the "Via way.hanami.run", which is technically correct because the message lack of DKIM signature for original gmail address. An intermidate mail forwarding service sign the message with way.hanami.run.

However, the way the UI represent it make the mail server that spend extra effort to sign their emails looks not trustworthy, while the message that failed both SPF and DKIM  looks `correct` on their UI.

I hope someone at Gmail will eventually fix this and we can all start to
sign our emails with DKIM like what we do with https.

Until next time for more email story.
