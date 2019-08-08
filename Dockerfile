# Copy from https://github.com/BVLC/caffe/blob/master/docker/gpu/Dockerfile
FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04
LABEL maintainer caffe-maint@googlegroups.com

RUN sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//https:\/\/mirrors\.163\.com\/ubuntu\//g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        python-dev \
        python-numpy \
        python-pip \
        python-setuptools \
        python-scipy && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/NVIDIA/nccl.git && cd nccl && make -j install

RUN pip install pip -U

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip install Cython networkx==2.2 scikit-image easydict protobuf opencv-python

