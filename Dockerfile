FROM nvidia/cuda:11.4.0-base-ubuntu20.04
WORKDIR /code
RUN apt-get update -y
RUN apt-get install -y python3.8 python3-pip
RUN apt-get install -y vim-tiny
RUN apt-get install -y --no-install-recommends build-essential gcc libsndfile1
COPY ./fairseq /code
RUN cd ./fairseq 
RUN pip install --editable ./
RUN pip install pandas torchaudio sentencepiece soundfile editdistance


RUN echo 'alias python=python3' >> ~/.bashrc
ENV PYTHONPATH="${PYTHONPATH}:/code/"
