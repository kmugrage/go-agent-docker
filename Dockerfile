FROM ubuntu
MAINTAINER Ken Mugrage <kmugrage@thoughtworks.com>

RUN echo "deb http://dl.bintray.com/gocd/gocd-deb /\n" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y --force-yes openjdk-7-jre go-agent

COPY go-agent /etc/default/go-agent
COPY docker-entrypoint.sh /usr/share/docker-entrypoint.sh

CMD /usr/share/go-agent/agent.sh
