### Build the image:

docker build -t python-ds-nlp-ml-nb .

### Run the image without token and password:

docker run -itd -p8888:8888 --rm -v"$PWD":/home/app python-ds-nlp-ml-nb

### Exec the image if necessary:

docker exec -it {CONTAINER_ID}  /bin/bash