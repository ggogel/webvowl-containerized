FROM alpine:3.13.6 AS get

ARG version=1.1.7

RUN apk add --no-cache wget

RUN cd /tmp && \
    wget -O /tmp/ROOT.war http://vowl.visualdataweb.org/downloads/webvowl_${version}.war

FROM tomcat:9-jre8-openjdk-slim-bullseye

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=get /tmp/ROOT.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
