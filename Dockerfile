FROM ubuntu:15.04

MAINTAINER joaobrito

ENV XWIKI_VERSION=7.4 \
    XWIKI_HOME=/home/xwiki_home

RUN apt-get update -y \
 && apt-get install -y openjdk-7-jre wget unzip vim \
 && mkdir -p "${XWIKI_HOME}" \
 && cd "${XWIKI_HOME}" \
 && wget http://download.forge.ow2.org/xwiki/xwiki-enterprise-jetty-hsqldb-"${XWIKI_VERSION}".zip \
 && unzip xwiki-enterprise-jetty-hsqldb-"${XWIKI_VERSION}".zip -d . \
 && rm -rf xwiki-enterprise-jetty-hsqldb-"${XWIKI_VERSION}".zip

EXPOSE 8080/tcp 443/tcp

VOLUME "${XWIKI_HOME}"
WORKDIR "${XWIKI_HOME}"/xwiki-enterprise-jetty-hsqldb-"${XWIKI_VERSION}"
ENTRYPOINT ["./start_xwiki.sh"]
