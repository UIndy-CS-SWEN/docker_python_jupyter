# syntax=docker/dockerfile:1
FROM ubuntu:21.10

ARG DEBIAN_FRONTEND="noninteractive"

RUN mkdir -p /home/app
WORKDIR /home/app

# replace bourne with bash to be able to source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh


# update the repository sources list
# and install dependencies
# apt-get install -y curl wget
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y wget \
    && apt-get -y autoclean
    
# install python3.9 
RUN apt-get install -y python3.9 python3.9-distutils

# install pip
RUN ln -s /usr/bin/python3.9 /usr/bin/python

# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py \
    && python3.9 get-pip.py \ 
    && python3.9 -m pip install --upgrade pip

# install numpy scipy matplotlib ipython pandas sympy nose
RUN pip install -U numpy scipy scikit-learn matplotlib ipython pandas 

# install nltk
RUN pip install -U nltk


CMD [ "/bin/bash" ]