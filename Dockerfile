FROM ubuntu:14.04
MAINTAINER Jeffery Utter "jeff@jeffutter.com"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-get -y install software-properties-common;\
    apt-add-repository ppa:brightbox/ruby-ng;\
    apt-add-repository ppa:chris-lea/node.js;\
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" > /etc/apt/sources.list;\
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty-security main universe " >> /etc/apt/sources.list;\
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty-updates main universe" >> /etc/apt/sources.list
RUN apt-get update

RUN locale-gen en_US.UTF-8 ;\
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale ;\
    dpkg-reconfigure locales

RUN apt-get -y install \
advancecomp \
build-essential \
curl \
gifsicle \
git \
imagemagick\
jhead \
jpegoptim \
libffi-dev \
libgdbm-dev \
libjpeg-turbo-progs \
libncurses5-dev \
libreadline-dev \
libssl-dev \
libyaml-dev \
nodejs \
optipng \
pngcrush \
ruby2.1 \
ruby2.1-dev \ 
trimage \
zlib1g-dev

RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc

RUN gem install bundler
