FROM ubuntu:14.04.3
MAINTAINER joao brito

ENV XWIKI_HOME /home/xwiki_home
RUN mkdir -p ${XWIKI_HOME}
EXPOSE 80/tcp 443/tcp
VOLUME ["${XWIKI_HOME}"]
WORKDIR ["${XWIKI_HOME}"]
ENTRYPOINT ["./start_xwiki_debug.sh"]