#This require around 20G for building image
#FROM tensorflow/tensorflow:latest-gpu-jupyter
FROM tensorflow/tensorflow:2.10.1-gpu-jupyter

RUN pip3 install torch torchvision torchaudio