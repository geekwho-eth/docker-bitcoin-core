# Build stage for compiled artifacts
FROM lightninglabs/taproot-assets:v0.3.2

# Map host user uid and gid
ARG HOST_UID=100
ARG HOST_GID=101

ENV USER_HOME=/home/tapd/
ENV USER_NAME=tapd
ENV USER_GROUP=tapd

LABEL maintainer="GeekWho <caijiamx@gmail.com>"
LABEL version="1.0"
LABEL description="A lightning tapd docker image base on lightninglabs/taproot-assets"

RUN addgroup ${USER_GROUP} --gid ${HOST_GID} --system
RUN adduser --uid ${HOST_UID} --system ${USER_NAME} --ingroup ${USER_GROUP}
RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add \
  shadow \
  su-exec

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["$USER_HOME"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["tapd"]
