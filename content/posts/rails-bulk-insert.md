---
title: "Rails Bulk Insert"
date: 2021-07-19T13:44:35-07:00
draft: true
---

A normal way of batch creating data is loop over an array and call
`.create` on the model. This is slow because Rails will send multiple
request to postgres, one per insert and also has to convert the row into
a Ruby object.

An example is our "Bulk Import". A few users with a few hundreds domain
will have th
