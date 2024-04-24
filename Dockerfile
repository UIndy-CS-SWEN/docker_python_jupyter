#FROM tensorflow/tensorflow:latest-gpu-jupyter
#FROM tensorflow/tensorflow:2.10.1-gpu-jupyter
#FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime
#This is the docker image for supporting pyTorch
FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

RUN mkdir -p /content
WORKDIR /content

RUN apt-get update \
    && apt-get install -y \
    curl \
    vim \
    python3 \
    python-is-python3 \
    pip 

RUN pip install torch torchvision torchaudio
#RUN pip install --user --upgrade gensim
#RUN pip install --user -U scikit-learn pandas nltk