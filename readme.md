# Docker image with Ruby

Base image for rubies.

* Based on phusion-base image

Contents
* ruby-install
* chruby





# Build

* build from github

```
docker build -t my-ruby github.com/maxivak/docker-ruby.git
```


# Examples

## Persistent Ruby binaries

Use base image to create Ruby binaries.

* build image
```
docker build -t my-ruby github.com/maxivak/docker-ruby.git
```

* create volume for ruby binaries

```
docker volume create v-my-rubies
```

* run container

```
docker run --name my-ruby -d \
    -v v-my-rubies:/opt/rubies my-ruby /sbin/my_init
```

* enter container and install ruby
```
docker exec -ti my-ruby bash

ruby-install ruby 2.3.3

source /usr/local/share/chruby/chruby.sh

chruby ruby-2.3.3

# install gems
gem install bundler bundle

```