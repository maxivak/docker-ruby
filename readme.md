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

# in container
ruby-install ruby 2.3.3

source /usr/local/share/chruby/chruby.sh

chruby ruby-2.3.3

# install gems
gem install bundler bundle

```

* destroy container
```
docker rm -f my-ruby
```

* run container with the same volume with ruby binaries
```
docker run --name my-ruby -d \
    -v v-my-rubies:/opt/rubies my-ruby /sbin/my_init
```

* enter container and check that ruby exists
```
docker exec -ti my-ruby bash

# in container
root@d73892e0740e:/# chruby
  ruby-2.3.3


# use ruby
chruby ruby-2.3.3

root@d73892e0740e:/# ruby -v
ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-linux]



```
