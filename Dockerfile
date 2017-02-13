FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y wget build-essential cmake libncurses5-dev

WORKDIR /usr/local/src/
RUN wget ftp://ftp.iij.ad.jp/pub/db/mysql/Downloads/MySQL-5.7/mysql-5.7.17.tar.gz && \
    tar zxvf mysql-5.7.17.tar.gz

WORKDIR /usr/local/src/mysql-5.7.17
RUN cmake -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/tmp/boost
RUN make install

ENV PATH $PATH:/usr/local/mysql/bin
