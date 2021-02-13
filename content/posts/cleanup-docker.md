---
title: "Cleanup Docker"
date: 2021-02-11T23:35:31-08:00
draft: false

author: Vinh

tags: ["docker", "docker-compose"]
categories: ["dev"]
series: ["Become A Better Developer"]
---

When you run a process in your computers, when that process is done,
everything is tear down together with it. Container is the next
generation of infrastructure. Everything run on a container, aim to have
one process per container.

When the process is done, the container is exit. But it won't cleanup
after itself. It leave behind its legacy:

- stopped container
- volume
- network


