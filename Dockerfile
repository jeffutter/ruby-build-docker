FROM ubuntu:14.04
MAINTAINER Jeffery Utter "jeff@jeffutter.com"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN locale-gen en_US.UTF-8 ;\
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale ;\
    dpkg-reconfigure locales

RUN adduser --disabled-login --gecos 'Deploy' deploy ;\
    mkdir -p /home/deploy/sockets /home/deploy/bundle /home/deploy/app

ENV HOME /home/deploy
ENV BUNDLE_PATH /home/deploy/bundle
WORKDIR /home/deploy/app

RUN apt-get update ;\
    apt-get -y install software-properties-common ;\
    apt-add-repository ppa:brightbox/ruby-ng ;\
    apt-add-repository ppa:chris-lea/node.js ;\
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" > /etc/apt/sources.list ;\
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty-security main universe " >> /etc/apt/sources.list ;\
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty-updates main universe" >> /etc/apt/sources.list ;\
    apt-get update

RUN apt-get -y install \
advancecomp \
build-essential \
curl \
g++ \
gifsicle \
git \
imagemagick \
jhead \
jpegoptim \
libffi-dev \
libgdbm-dev \
libjpeg-turbo-progs \
libmysql++-dev \
libmysqlclient-dev \
libncurses5-dev \
libpq-dev \
libreadline-dev \
libssl-dev \
libyaml-dev \
libxml2-dev \
libxslt-dev \
make \
nodejs \
nginx \
openssl \
optipng \
pdftk \
phantomjs \
pngcrush \
ruby2.1 \
ruby2.1-dev \
supervisor \
trimage \
wget \
zlib1g-dev

RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc ;\
    gem install bundler foreman