FROM alpine:3.13.6 AS get

ARG version=1.1.7

RUN apk add --no-cache wget

RUN cd /tmp && \
    wget -O /tmp/ROOT.war http://vowl.visualdataweb.org/downloads/webvowl_${version}.war

FROM openjdk:8-jre-alpine

RUN apk add --no-cache bash

RUN wget -qO- https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz | tar xz -C /usr/local && \
    mv /usr/local/apache-tomcat-9.0.95 /usr/local/tomcat && \
    rm -rf /usr/local/tomcat/webapps/*

COPY --from=get /tmp/ROOT.war /usr/local/tomcat/webapps/ROOT.war

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]