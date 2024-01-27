#!/bin/sh

#stop all the running docker containers and then remove all of them
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

#remove the image called "ubuntu" and "python-ds-nlp-ml-nb"
docker image rm $(docker image ls | grep 'python_jupyter' | awk '{print $3}')
docker image rm $(docker image ls | grep 'ubuntu' | awk '{print $3}')

docker build -t python_jupyter .

docker run -itd -p8888:8888 --rm -v"$PWD":/home/app python_jupyter