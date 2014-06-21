
#
# Originally Java Dockerfile from https://github.com/dockerfile/java
#

# Pull base image.
FROM dockerfile/ubuntu
MAINTAINER Ken Mugrage <kmugrage@thoughtworks.com>

# My agents need Ruby
RUN apt-get install -y ruby1.9.1
RUN gem install rake

RUN apt-get update && apt-get install -y default-jre-headless

# When the public apt repository is live this won't be needed, but for now I copy it in and 
# install it manually
ADD go-agent-14.1.0-18882.deb /tmp/go-agent-14.1.0-18882.deb
RUN dpkg -i -E /tmp/go-agent-14.1.0-18882.deb

# This file has my authorization string so that I don't have to approve new agents. 
ADD autoregister.properties /var/lib/go-agent/config/autoregister.properties

# This file is also very specific to my installation. It tells the Go agent where the Go server
# is on my internal network.
ADD go-agent /etc/default/go-agent

# This should probably be something like supervisord to keep the container running
CMD /usr/share/go-agent/agent.sh && tail -F /var/log/go-agent/go-agent.log
