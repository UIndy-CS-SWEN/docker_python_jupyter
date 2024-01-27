#docker run --rm -itd --gpus all -p 8888:8888 -v $(pwd)/docker-data:/content tensorflow/tensorflow:2.10.1-gpu-jupyter jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password='argon2:$argon2id$v=19$m=10240,t=10,p=8$gu1oaVTudqMVaMY+ufyldg$dXMYv+IMfcsfNv9ZiEReHp4KoXEb0bW0o8qYFUU13hg'


#To build
docker build -t py_jupyter .
#To run
docker run --rm -itd --gpus all -p 8888:8888 -v $(pwd)/docker-data:/content py3_jupyter jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password='argon2:$argon2id$v=19$m=10240,t=10,p=8$gu1oaVTudqMVaMY+ufyldg$dXMYv+IMfcsfNv9ZiEReHp4KoXEb0bW0o8qYFUU13hg'

#from jupyter_server.auth import passwd
#print(passwd('root@JyServer#123!'))



