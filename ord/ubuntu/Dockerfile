FROM ubuntu:23.04 as builder

LABEL maintainer="GeekWho <caijiamx@gmail.com>"
LABEL version="1.0"
LABEL description="A bitcoin-core docker image"

RUN apt-get update -y \
  && apt-get install -y ca-certificates wget curl --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install.sh
ARG ORD_INSTALL_SH="https://raw.githubusercontent.com/ordinals/ord/master/install.sh"
# default ENV
ARG TARGETPLATFORM
ENV TARGET=x86_64-unknown-linux-gnu

RUN wget ${ORD_INSTALL_SH} && chmod +x install.sh \
  && if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then export TARGET=aarch64-apple-darwin; fi \
  && ./install.sh --to /usr/local/bin --target ${TARGET}

# Second stage
FROM ubuntu:23.04

# Map host user uid and gid
ARG HOST_UID=100
ARG HOST_GID=101

ENV USER_HOME=/home/ord/
ENV USER_NAME=ord
ENV USER_GROUP=ord
ENV BITCOIN_RPC_LISTEN=127.0.0.1:8332

RUN groupadd --gid ${HOST_GID} ${USER_GROUP} \
  && useradd --create-home --no-log-init -u ${HOST_UID} -g ${HOST_GID} ${USER_NAME} \
  && apt-get update -y \
  && apt-get install -y gosu curl --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=builder /usr/local/bin/ord /usr/local/bin/

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["$USER_HOME"]

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

CMD ["ord"]
