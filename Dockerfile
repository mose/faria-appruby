FROM mose/faria-basedock
MAINTAINER mose mose@mose.com

RUN apt-get -y -qq update
RUN apt-get -y -qq install python-software-properties
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get -y -qq update

RUN apt-get -y -qq install ruby1.9
RUN apt-get -y -qq install rubygems ruby-switch

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "gem: --no-ri --no-rdoc" > /root/.gemrc
RUN gem install bundler
