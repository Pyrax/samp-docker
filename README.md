SA-MP Docker container
======================

This repository features some Dockerfiles for setting up a SA-MP server through Docker containers.

## How to use ##

```
docker run -d -p 7777:7777/udp -e SAMP_RCON_PASSWORD=secret --name testsrv pyrax/samp:0.3.7r2-1
```