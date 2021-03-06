FROM nvidia/cuda:11.4.0-base-ubuntu20.04
WORKDIR /code

RUN apt-get update -y
RUN apt-get install -y python3.8 python3-pip
RUN apt-get install -y vim-tiny
RUN apt-get install -y --no-install-recommends build-essential gcc libsndfile1 git

COPY ./fairseq /code

RUN cd ./fairseq 
RUN pip install --editable ./
RUN pip install pandas torchaudio sentencepiece soundfile editdistance tensorboardX

RUN cd /tmp
RUN git clone https://github.com/NVIDIA/apex
RUN cd apex
RUN pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./

RUN echo 'alias python=python3' >> ~/.bashrc
ENV PYTHONPATH="${PYTHONPATH}:/code/"
