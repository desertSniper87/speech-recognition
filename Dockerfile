FROM nvidia/cuda:11.4.0-base-ubuntu20.04
WORKDIR /code
RUN apt-get update -y
RUN apt-get install -y python3.8 python3-pip
COPY ./fairseq /code
RUN cd ./fairseq 
RUN pip install --editable ./