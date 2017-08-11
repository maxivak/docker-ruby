FROM phusion/baseimage:0.9.20

RUN apt-get update
RUN apt-get -y install libcurl3 git curl  wget     g++ libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3   autoconf libgdbm-dev   libncurses5-dev   automake   libtool  bison   pkg-config   libffi-dev   liblzma-dev   zlib1g-dev   libgmp-dev libgmp3-dev

# ruby-install

RUN cd /tmp && wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz && \
    tar -xzvf ruby-install-0.6.1.tar.gz && \
    cd ruby-install-0.6.1/ && \
    make install


#ruby-install ruby 2.3.3
#ruby-install ruby 2.3.4


# chruby
RUN cd /tmp && \
    wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz && \
    tar -xzvf chruby-0.3.9.tar.gz && \
    cd chruby-0.3.9/ && \
    make install


#RUN source /usr/local/share/chruby/chruby.sh

#chruby ruby-2.3.3
#gem install bundler
#gem install redis


RUN echo "source /usr/local/share/chruby/chruby.sh" >> /root/.bash_profile
RUN echo "source /usr/local/share/chruby/chruby.sh" >> /root/.bashrc

#
RUN echo "gem: --no-document" >> /root/.gemrc

