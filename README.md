SA-MP Docker container [![Docker pulls](https://img.shields.io/docker/pulls/pyrax/samp.svg "Number of Docker pulls")](https://hub.docker.com/r/pyrax/samp/)
======================

This repository features some Dockerfiles for setting up a SA-MP server through Docker containers.

## How to use ##

NOTE: Make sure you have Docker installed properly before following any of the steps below. Visit the [official Docker site](https://www.docker.com/) for further instructions on the installation of Docker.

### Run container

Latest SA-MP version: 
```
docker run -d -p 7777:7777/udp -e SAMP_RCON_PASSWORD=secret --name testsrv pyrax/samp
```

Specific version:
```
docker run -d -p 7777:7777/udp -e SAMP_RCON_PASSWORD=secret --name testsrv pyrax/samp:0.3.7r2-1
```

### Environment variables

As seen in the example above you can use environment variables to change the server.cfg file. In fact, you have to set atleast the SAMP_RCON_PASSWORD variable in order to start the server - otherwise the RCON password will be "changeme" and the server will shutdown right after start.

For this purpose, the entrypoint looks for any environment variable beginning with "SAMP_" and replaces the corresponding value in the server.cfg or appends a new line with the key-value-pair to the server.cfg if it is not present yet.

Examples:
```
docker run -d -p 7777:7777/udp -e SAMP_RCON_PASSWORD=secret -e SAMP_HOSTNAME="SA-MP Docker Server" --name test pyrax/samp
# "rcon_password" exists in the server.cfg, so the value is changed from "changeme" (default) to "secret"
# "hostname" also exists in the server.cfg, so it will be changed from the default value to "SA-MP Docker Server"
```
```
docker run -d -p 7777:7777/udp -e SAMP_RCON_PASSWORD=secret -e SAMP_PLUGINS="crashdetect" --name test pyrax/samp
# "rcon_password" exists in the server.cfg, so the value is changed from "changeme" (default) to "secret"
# "plugins" does not exist in the server.cfg, therefore a line containing "plugins crashdetect" is being appended to the server.cfg
```
