FROM mose/faria-basedock
MAINTAINER mose <mose@mose.com>

RUN apt-get -y -qq update && apt-get -y -qq install python-software-properties build-essential libssl-dev libreadline-dev imagemagick libmagick++-dev libmagic-dev
RUN apt-add-repository -y ppa:brightbox/ruby-ng
RUN apt-add-repository -y ppa:chris-lea/node.js
RUN apt-get -y -qq update
RUN apt-get -y -qq install ruby2.0 rubygems nodejs

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "gem: --no-ri --no-rdoc" > /root/.gemrc
RUN gem install bundler
