FROM alpine:latest

LABEL Patrick Tavares <tavarespatrick01@gmail.com>

ENV CCAT_VERSION 1.1.0

RUN apk add wget

RUN wget https://github.com/jingweno/ccat/releases/download/v${CCAT_VERSION}/linux-amd64-${CCAT_VERSION}.tar.gz -O ccat.tar.gz \
    && tar xzf ccat.tar.gz \
    && cp linux-amd64-${CCAT_VERSION}/ccat /usr/local/bin \
    && chmod +x /usr/local/bin/ccat \
    && rm -rf linux-amd64-${CCAT_VERSION} \
    && rm -rf *.gz

VOLUME /ccat
WORKDIR /ccat

ENTRYPOINT ["ccat"]
CMD ["help"]
