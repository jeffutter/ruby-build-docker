FROM ruby:2.1.3
MAINTAINER Jeffery Utter "jeff@jeffutter.com"


RUN curl -sL https://deb.nodesource.com/setup | bash - ;\
  apt-get install -y \
  advancecomp \
  gifsicle \
  jhead \
  jpegoptim \
  libjpeg-progs \
  locales \
  nodejs \
  nginx \
  optipng \
  pdftk \
  pngcrush \
  trimage \
  && rm -rf /var/lib/apt/lists/*

RUN curl https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 > phantomjs.tar.bz2 ;\
    tar -xvjf  tar -xvjf phantomjs.tar.bz2 ;\
    mv phantomjs/bin/phantomjs /usr/local/bin/ ;\
    rm -rf phantomjs*

RUN locale-gen Ven_US.UTF-8 ;\
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale ;\
    dpkg-reconfigure locales

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 
ENV HOME /home/deploy
ENV BUNDLE_PATH /home/deploy/bundle
WORKDIR /home/deploy/app

RUN adduser --disabled-login --gecos 'Deploy' deploy ;\
    mkdir -p /home/deploy/sockets /home/deploy/bundle /home/deploy/app ;\
    echo 'gem: --no-rdoc --no-ri' >> /home/deploy/.gemrc ;\
    chown deploy:deploy /home/deploy/.gemrc 
