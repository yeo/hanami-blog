---
title: "Setup Postgress Connection With Multiple DB in Go Lang and Echo"
date: 2021-06-25T13:29:11-07:00
draft: true
---

Hanami use Go to power our mail servers and routing processing. One of
the design is that the postgres database can go down and the mail server
to continue to work. For that, we almost keep a in-memory clone of core
data from Postgres. Due to the heavi query that we run to fetch data, we
split read and write to different database.

In this post, we share how we approach this and 
