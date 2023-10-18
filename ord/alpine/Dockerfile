# Build stage for builder
FROM alpine as builder

RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add autoconf automake build-base libressl bash

# install.sh
ENV ORD_INSTALL_SH="https://raw.githubusercontent.com/ordinals/ord/master/install.sh"

ARG TARGETPLATFORM
ENV TARGET=x86_64-unknown-linux-gnu

RUN wget ${ORD_INSTALL_SH} && chmod +x install.sh \
  && if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then export TARGET=aarch64-apple-darwin; fi \
  && ./install.sh --to /usr/local/bin --target ${TARGET}

# Build stage for compiled artifacts
FROM alpine

ARG UID=100
ARG GID=101

ENV ORD_YAML=/home/ord/ord.yaml
ENV ORD_USER=ord
ENV ORD_RPC_URL=127.0.0.1:8332

LABEL maintainer="GeekWho <caijiamx@gmail.com>"
LABEL version="1.0"
LABEL description="A bitcoin-core docker image"

RUN addgroup ord --gid ${GID} --system
RUN adduser --uid ${UID} --system ord --ingroup ord
RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add \
  libevent \
  libzmq \
  shadow \
  sqlite-dev \
  su-exec

COPY --from=builder /usr/local/bin/ord /usr/local/bin/
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["$ORD_YAML"]

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

RUN ord --version | grep "ord"

CMD ["ord","--config","$ORD_YAML","--rpc-url","$ORD_RPC_URL","server","--http-port","8080"]
