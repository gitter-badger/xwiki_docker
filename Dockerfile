FROM ubuntu:15.04

MAINTAINER joaobrito

ENV XWIKI_HOME=/home/xwiki_home \
    XWIKI_VERSION=7.4

RUN apt-get update -y \
 && apt-get install -y openjdk-7-jre wget vim 
 #&& mkdir -p ${XWIKI_HOME} \
 #&& cd ${XWIKI_HOME} \
 #&& wget http://download.forge.ow2.org/xwiki/xwiki-enterprise-jetty-hsqldb-${XWIKI_VERSION}.zip \
 #&& unzip xwiki-enterprise-jetty-hsqldb-${XWIKI_VERSION}.zip -d . \
 #&& rm -f xwiki-enterprise-jetty-hsqldb-${XWIKI_VERSION}.zip

EXPOSE 8080/tcp 443/tcp

VOLUME ["${XWIKI_HOME}"]

WORKDIR ${XWIKI_HOME}

ENTRYPOINT ["./start_xwiki.sh"]
