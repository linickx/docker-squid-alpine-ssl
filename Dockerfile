FROM alpine

MAINTAINER Nick [linickx.com]

RUN apk update \
    && apk add squid \
    && apk add curl ca-certificates libressl\
    && rm -rf /var/cache/apk/*

COPY start-squid.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/start-squid.sh"]
