FROM mose/faria-basedock
MAINTAINER mose <mose@mose.com>

RUN apt-get -y -qq update
RUN apt-get -y -qq install \
  python-software-properties build-essential openssl libssl-dev libreadline6 libreadline6-dev \
  imagemagick libmagick++-dev libyaml-dev libmagic-dev libffi-dev zlib1g zlib1g-dev \
  libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev \
  automake libtool bison
RUN apt-add-repository -y ppa:chris-lea/node.js
RUN apt-get -y -qq update
RUN apt-get -y -qq install nodejs
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /tmp && wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.bz2
RUN cd /tmp && tar xjf ruby-2.1.1.tar.bz2
RUN cd /tmp/ruby-2.1.1 && ./configure --disable-install-doc
RUN cd /tmp/ruby-2.1.1 && make && make install
RUN rm -rf /tmp/ruby-2.1.1
RUN rm -f /tmp/ruby-2.1.1.tar.bz2

RUN echo "gem: --no-ri --no-rdoc" > /root/.gemrc
RUN gem update --system
RUN gem install bundler
