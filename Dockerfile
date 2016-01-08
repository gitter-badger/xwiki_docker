FROM ubuntu:15.04

MAINTAINER joaobrito

ENV XWIKI_HOME=/home/xwiki_home

RUN apt-get update -y \
 && apt-get install -y openjdk-7-jre wget unzip vim \
 && mkdir -p /home/xwiki_home 
 
VOLUME ["/home/xwiki_home"]

RUN cd /home/xwiki_home \
 && wget http://download.forge.ow2.org/xwiki/xwiki-enterprise-jetty-hsqldb-7.4.zip \
 && unzip xwiki-enterprise-jetty-hsqldb-7.4.zip -d . \
 && rm -rf xwiki-enterprise-jetty-hsqldb-7.4.zip

EXPOSE 8080/tcp 443/tcp

WORKDIR /home/xwiki_home/xwiki-enterprise-jetty-hsqldb-7.4

ENTRYPOINT ["./start_xwiki.sh"]
