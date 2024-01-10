# Build stage for compiled artifacts
FROM lightninglabs/lightning-terminal:v0.12.2-alpha

# Map host user uid and gid
ARG HOST_UID=100
ARG HOST_GID=101

ENV USER_HOME=/home/litd/
ENV USER_NAME=litd
ENV USER_GROUP=litd

LABEL maintainer="GeekWho <caijiamx@gmail.com>"
LABEL version="1.0"
LABEL description="A lightning litd docker image base on lightninglabs/lightning-terminal"

RUN addgroup ${USER_GROUP} --gid ${HOST_GID} --system
RUN adduser --uid ${HOST_UID} --system ${USER_NAME} --ingroup ${USER_GROUP}
RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add \
  shadow \
  su-exec

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["$USER_HOME"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["litd"]
