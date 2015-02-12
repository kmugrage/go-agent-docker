
#
# Originally Java Dockerfile from https://github.com/dockerfile/java
#

# Pull base image.
FROM dockerfile/ubuntu
MAINTAINER Ken Mugrage <kmugrage@thoughtworks.com>

# My agents need Ruby
RUN apt-get update
RUN apt-get install -y ruby1.9.3
RUN gem install rake

RUN apt-get update && apt-get install -y default-jre-headless

# Modified to wget the agent from the download site. When a package repo
# is available we can use that and always get the lastest
RUN cd /tmp && wget -nc -nv http://download.go.cd/gocd-deb/go-agent-14.4.0-1356.deb
RUN dpkg -i -E /tmp/go-agent-14.4.0-1356.deb

# This file has my authorization string so that I don't have to approve new agents. 
ADD autoregister.properties /var/lib/go-agent/config/autoregister.properties

# This file is also very specific to my installation. It tells the Go agent where the Go server
# is on my internal network.
ADD go-agent /etc/default/go-agent

# This should probably be something like supervisord to keep the container running
CMD /usr/share/go-agent/agent.sh && tail -F /var/log/go-agent/go-agent.log
