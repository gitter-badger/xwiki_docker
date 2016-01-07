FROM 8-jdk

MAINTAINER joaobrito

ENV XWIKI_HOME=/home/xwiki_home

RUN mkdir -p ${XWIKI_HOME}

EXPOSE 8080/tcp 443/tcp

VOLUME ["${XWIKI_HOME}"]

WORKDIR ${XWIKI_HOME}

ENTRYPOINT ["./start_xwiki.sh"]
