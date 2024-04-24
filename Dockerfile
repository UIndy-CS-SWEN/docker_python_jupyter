#This is the docker image for supporting pyTorch
FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

RUN mkdir -p /content
WORKDIR /content

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]


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

RUN pip install torch torchvision torchaudio
RUN pip install jupyterlab

#RUN pip install --user --upgrade gensim
#RUN pip install --user -U scikit-learn pandas nltk

# Fix permissions on /etc/jupyter as root
USER root
RUN fix-permissions /etc/jupyter/



# Copy local files as late as possible to avoid cache busting
COPY start-lab-unsecure.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/start-lab-unsecure.sh


EXPOSE 8888

CMD ["/usr/local/bin/start-lab-unsecure.sh"]

