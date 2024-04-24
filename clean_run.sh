#!/bin/sh

#stop all the running docker containers and then remove all of them
docker stop py3_jupyter_con

#remove the image called "ubuntu" and "python-ds-nlp-ml-nb"
docker image rm -f $(docker image ls | grep 'py3_jupyter' | awk '{print $3}')
docker image rm -f $(docker image ls | grep 'nvidia' | awk '{print $3}')

docker build -t py3_jupyter .


#docker run --rm -itd --gpus all -p 8888:8888  -v $(pwd)/docker-data:/content --name py3_jupyter_con py3_jupyter
#docker run --rm -itd --gpus all -p 8888:8888 -v $(pwd)/docker-data:/content py3_jupyter jupyter lab --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password='argon2:$argon2id$v=19$m=10240,t=10,p=8$gu1oaVTudqMVaMY+ufyldg$dXMYv+IMfcsfNv9ZiEReHp4KoXEb0bW0o8qYFUU13hg