FROM ubuntu:15.10

MAINTAINER joaobrito

ENV XWIKI_HOME=/home/xwiki_home

RUN mkdir -p ${XWIKI_HOME}

EXPOSE 80/tcp 443/tcp

VOLUME ["${XWIKI_HOME}"]

WORKDIR ${XWIKI_HOME}

ENTRYPOINT ["./start_xwiki.sh"]
