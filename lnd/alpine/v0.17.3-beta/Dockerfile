# Build stage for compiled artifacts
FROM lightninglabs/lnd:v0.17.3-beta

# Map host user uid and gid
ARG HOST_UID=100
ARG HOST_GID=101

ENV USER_HOME=/home/lnd/
ENV USER_NAME=lnd
ENV USER_GROUP=lnd

LABEL maintainer="GeekWho <caijiamx@gmail.com>"
LABEL version="1.0"
LABEL description="A lightning lnd docker image base on lightninglabs/lnd"

RUN addgroup ${USER_GROUP} --gid ${HOST_GID} --system
RUN adduser --uid ${HOST_UID} --system ${USER_NAME} --ingroup ${USER_GROUP}
RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add \
  shadow \
  su-exec

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["$USER_HOME"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["lnd"]
