---
title: "Cleanup Docker"
date: 2021-02-11T23:35:31-08:00
draft: false

author: Vinh

tags: ["docker", "docker-compose"]
categories: ["dev"]
series: ["Become A Better Developer"]
---

If you do heavy development with docker without a cleanup strategy soon
your disk will fill at the time you really have to ship something out
ASAP because production is on-fire but you cannot because docker refused
to let you do anything with it.

When we run a process in our computers, once that process is done,
everything is tear down together with it. Container is how many of
us operating our infrastructure nowaday.

Everything run on a container, aim to have one process per container.
When the process is done, the container is exit. But it won't cleanup
after itself. It leave behind its legacy.

# Docker stuff that accumulate

You need to keep an eyes on these

- stopped containers
- volume
- images
- network

If you have enough space, you may not worry too much about disk space
but the network is an important one. By default, Docker uses bridge
network, and it has a limit of 31 networks. When reaching that limit,
you will see this message:

```
could not find an available, non-overlapping IPv4 address pool among the defaults to assign to the network
```

This happens if you're a heavy docker-compose user which create a network
per project. You can workaround by setting a customi `--subnet` such as:

```
docker network create dada --subnet 192.167.11.0/24
```

But anyway, the point of this article is to clean up

# Cleanup with docker

## Cleanup stopped containers

```
docker rm -v $(docker ps --all --quiet --filter 'status=exited')
```

This will find all container in exited status and output their ID once
per line so we can feed it to other shell command.

We use `docker rm -v` to also delete any anonymous volume(volumes without
an explicitly name).

## Cleanup volumes

Above comand should remove volumes that are associated with that
container. If you manually create volumes and want to delete any volumes
that are not being used:

```
docker volume rm $(docker volume ls --quiet --filter 'dangling=true')
```

## Cleanup images

Docker images are generally safe to delete all. We can fetch them
on-demand when we need to. Usually after a image cleaning, build time is
longer because docker daemon has to spend time downloading image again

```
docker rm --force $(docker images --quiet)
```

Here we used `--force` to delete images even if a container are using
that. We can always fetch them again later

## Cleanup networks

Easy peasy. We can delete anything, it will be re-created on-demand
later on

```
docker network rm $(docker network ls --quiet)
```

# Cleanup with docker-compose

If you spin up containers using docker-compose, we have an easy way to
cleanup resources associated with thart particular compose file.

```
docker-compose down --volumes --rmi all --remove-orphans
```

Unfortunately this command won't remove anonymous volume so you have to
deal with them.

# One command to rule them all

docker is ephemeral and we can always re-fetch the image, re-seed our
database for development, or this is just a CI system then we can delete
verything

```
docker system prune --all --force --volumes
```
