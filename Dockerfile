
#
# Originally Java Dockerfile from https://github.com/dockerfile/java
#

# Pull base image.
FROM dockerfile/ubuntu
MAINTAINER Ken Mugrage <kmugrage@thoughtworks.com>

# My agents need Ruby
RUN apt-get install -y ruby1.9.1
RUN gem install rake

# Install Java - As it turns out installing openjdk via apt-get also attempts to install fuse. This
# requires running docker in privileged mode, which I didn't want to do.

RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer

# When the public apt repository is live this won't be needed, but for now I copy it in and 
# install it manually
ADD go-agent-14.1.0-18882.deb /tmp/go-agent-14.1.0-18882.deb
RUN dpkg -i /tmp/go-agent-14.1.0-18882.deb

# This file has my authorization string so that I don't have to approve new agents. 
ADD autoregister.properties /var/lib/go-agent/config/autoregister.properties

# This file is also very specific to my installation. It tells the Go agent where the Go server
# is on my internal network.
ADD go-agent /etc/default/go-agent

# This should probably be something like supervisord to keep the container running
CMD /etc/init.d/go-agent start && tail -F /var/log/go-agent/go-agent.log
