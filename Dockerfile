#This is the docker image for supporting pyTorch
FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

ARG NB_USER="jovyan"
ARG NB_UID="1000"
ARG NB_GID="100"

USER root

RUN mkdir -p /content
WORKDIR /content

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y \
    curl \
    vim \
    python3 \
    python-is-python3 \
    pip \
    bzip2 \
    locales \
    libx11-6 \
    software-properties-common \
    && apt-get -y autoclean \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

RUN pip install --upgrade pip
RUN pip install torch torchvision torchaudio
RUN pip install jupyterlab

# Current stable release for CPU and GPU
RUN pip install tensorflow

#RUN pip install --user --upgrade gensim
RUN pip install --user -U scikit-learn pandas matplotlib

# Copy local files as late as possible to avoid cache busting
COPY start-lab-unsecure.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/start-lab-unsecure.sh

# Copy a script that we will use to correct permissions after running certain commands
COPY fix-permissions /usr/local/bin/fix-permissions
RUN chmod a+rx /usr/local/bin/fix-permissions

# Fix permissions on /etc/jupyter as root
#RUN fix-permissions /etc/jupyter/

EXPOSE 8888

CMD ["/usr/local/bin/start-lab-unsecure.sh"]

