#FROM ubuntu:22.04
#nvidia/cuda:12.3.1-base-ubuntu22.04
ARG CUDA_VERSION=12.3.1
FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu22.04


ARG DEBIAN_FRONTEND="noninteractive"
#ARG NB_USER="jovyan"
#ARG NB_UID="1000"
#ARG NB_GID="100"

RUN mkdir -p /home/app
WORKDIR /home/app

# replace bourne with bash to be able to source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# update the repository sources list
# and install dependencies
# apt-get install -y curl wget
RUN apt-get update \
    && apt-get install -y \
    curl \
    vim \
    wget \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    locales \
    libx11-6 \
    software-properties-common \
    && apt-get -y autoclean \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

# Installing Nvidia Tool-kit
RUN curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | \
    sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
    && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
RUN sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list
RUN apt-get update && apt-get install -y nvidia-container-toolkit

# install pip (in the system using root)
RUN ln -s /usr/bin/python3.10 /usr/bin/python


# install pip
RUN apt-get install -y python3-pip
RUN pip3 --version
RUN pip --version

# use pip to install Jupyter
RUN pip install notebook

# install ipywidgets
RUN pip install ipywidgets

# install Excel package
RUN pip install xlrd

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
 && chown -R user:user /home/app
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user


# Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    #NB_USER="${NB_USER}" \
    #NB_UID=${NB_UID} \
    #NB_GID=${NB_GID} \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
#ENV PATH="${CONDA_DIR}/bin:${PATH}" \
#    HOME="/home/${NB_USER}"

USER user

# All users can use /home/user as their home directory
ENV HOME=/home/user
RUN mkdir $HOME/.cache $HOME/.config \
 && chmod -R 777 $HOME

# Adding this path because the package will be installed in this path
ENV PATH "$PATH:/home/user/.local/bin"

# deal with pip
RUN pip install -U pip setuptools wheel

# install numpy scipy matplotlib ipython pandas nltk
RUN pip install --user -U numpy scipy scikit-learn matplotlib ipython pandas nltk

# install the gensim
RUN pip install --user --upgrade gensim

# install
RUN pip install --user -U torch torchvision torchaudio

# install tensorflow and keras
RUN pip install --user -U tensorflow==2.2.0

ARG PYTHON_VERSION=3.10

USER root

# Copy local files as late as possible to avoid cache busting
COPY start-notebook-unsecure.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/start-notebook-unsecure.sh


USER user
EXPOSE 8888

CMD ["/usr/local/bin/start-notebook-unsecure.sh"]
#CMD [ "/bin/bash" ]
