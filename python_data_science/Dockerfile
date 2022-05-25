# syntax=docker/dockerfile:1
FROM ubuntu:latest

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

# replace bourne with bash to be able to source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh


# update the repository sources list
# and install dependencies
# apt-get install -y curl git python build-essential
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get -y autoclean
