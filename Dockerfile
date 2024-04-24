#FROM tensorflow/tensorflow:latest-gpu-jupyter
#FROM tensorflow/tensorflow:2.10.1-gpu-jupyter
FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-devel

#RUN pip install torch torchvision torchaudio
RUN pip install --user --upgrade gensim
RUN pip install --user -U scikit-learn pandas nltk