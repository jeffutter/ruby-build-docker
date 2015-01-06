FROM ubuntu:14.04
MAINTAINER Jeffery Utter "jeff@jeffutter.com"

RUN adduser --disabled-login --gecos 'Deploy' deploy ;\
    mkdir -p /home/deploy/sockets /home/deploy/bundle /home/deploy/app

RUN locale-gen en_US.UTF-8 ;\
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale ;\
    dpkg-reconfigure locales
    
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 
ENV HOME /home/deploy
ENV BUNDLE_PATH /home/deploy/bundle
WORKDIR /home/deploy/app

RUN DEBIAN_FRONTEND=noninteractive apt-get update ;\
    apt-get -y install curl software-properties-common ;\
    apt-add-repository ppa:brightbox/ruby-ng ;\
    curl -sL https://deb.nodesource.com/setup | sudo bash - ;\
    rm -rf /var/lib/apt/lists/* 

RUN DEBIAN_FRONTEND=noninteractive apt-get update ;\
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
  ruby2.2 \
  ruby2.2-dev \
  wget \
  zlib1g-dev \
# Webkit deps for capybara-webkit
  libqtwebkit-dev \
  libqt5webkit5-dev \
# Passenger
  libcurl4-openssl-dev \
  libpcre3-dev \ 
  && rm -rf /var/lib/apt/lists/*

RUN echo 'gem: --no-rdoc --no-ri' >> /home/deploy/.gemrc ;\
    chown deploy:deploy /home/deploy/.gemrc ;\
    gem install --no-rdoc --no-ri bundler
