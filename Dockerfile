
#
# Java Dockerfile
#
# https://github.com/dockerfile/java
#

# Pull base image.
FROM dockerfile/ubuntu

RUN apt-get install -y ruby1.9.1
RUN gem install rake

# Install Java.
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer

ADD go-agent-14.1.0-18882.deb /tmp/go-agent-14.1.0-18882.deb

RUN dpkg -i /tmp/go-agent-14.1.0-18882.deb

ADD autoregister.properties /var/lib/go-agent/config/autoregister.properties

ADD go-agent /etc/default/go-agent

CMD /etc/init.d/go-agent start && tail -F /var/log/go-agent/go-agent.log
