FROM debian:buster-slim as builder

RUN apt update && apt install -y \
    mercurial \
    make \
    cmake \
    libcurl4-openssl-dev \
    libgtest-dev \
    libjsoncpp-dev \
    libboost-all-dev \
    uuid-dev \
    clang \
    patch \
    unzip

WORKDIR /root

RUN hg clone https://orthanc.uclouvain.be/hg/orthanc-authorization

RUN mkdir -p /root/orthanc-authorization/build

WORKDIR /root/orthanc-authorization/build

RUN cmake -DSTATIC_BUILD=ON -DCMAKE_BUILD_TYPE=Release .. && make
