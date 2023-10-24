# Build stage for builder
FROM alpine as builder

RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add autoconf automake build-base libressl bash curl

# install.sh
ENV ORD_INSTALL_SH="https://raw.githubusercontent.com/ordinals/ord/master/install.sh"

ARG TARGETPLATFORM
ENV TARGET=x86_64-unknown-linux-gnu

RUN wget ${ORD_INSTALL_SH} && chmod +x install.sh \
  && if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then export TARGET=aarch64-apple-darwin; fi \
  && ./install.sh --to /usr/local/bin --target ${TARGET}

# Build stage for compiled artifacts
FROM alpine

# Map host user uid and gid
ARG HOST_UID=100
ARG HOST_GID=101

ENV USER_HOME=/home/ord/
ENV USER_NAME=ord
ENV USER_GROUP=ord
ENV BITCOIN_RPC_LISTEN=127.0.0.1:8332

LABEL maintainer="GeekWho <caijiamx@gmail.com>"
LABEL version="1.0"
LABEL description="An Ordinals ORD docker image"

RUN addgroup ${USER_GROUP} --gid ${HOST_GID} --system
RUN adduser --uid ${HOST_UID} --system ${USER_NAME} --ingroup ${USER_GROUP}
RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add \
  libevent \
  libzmq \
  shadow \
  sqlite-dev \
  su-exec

COPY --from=builder /usr/local/bin/ord /usr/local/bin/
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["$USER_HOME"]

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

CMD ["ord"]
