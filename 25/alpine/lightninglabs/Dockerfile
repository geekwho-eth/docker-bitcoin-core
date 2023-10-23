# Build stage for compiled artifacts, only for linux/amd64
FROM --platform=linux/amd64 lightninglabs/bitcoin-core:25-alpine

# Map host user uid and gid, juse same as UID and GID in base image
ARG HOST_UID=100
ARG HOST_GID=101

ENV USER_HOME=/home/bitcoin/
ENV USER_NAME=bitcoin
ENV USER_GROUP=bitcoin

LABEL maintainer="GeekWho <caijiamx@gmail.com>"
LABEL version="1.0"
LABEL description="A bitcoin core docker image base on lightninglabs/bitcoin-core"

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bitcoind"]
