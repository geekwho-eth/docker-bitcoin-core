FROM ubuntu:24.04 as builder

LABEL maintainer="GeekWho <caijiamx@gmail.com>"
LABEL version="1.0"
LABEL description="A bitcoin-core docker image"

RUN apt-get update -y \
  && apt-get install -y ca-certificates curl git gnupg gosu python3 wget --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG TARGETPLATFORM
ENV BITCOIN_VERSION=27.0
ENV SIGS_REPO_URL="https://github.com/bitcoin-core/guix.sigs.git"
ENV SIGS_CLONE_DIR="guix.sigs"
ENV VERIFY_SCRIPT_URL="https://raw.githubusercontent.com/bitcoin/bitcoin/master/contrib/verify-binaries/verify.py"
ENV TMPDIR="/tmp/bitcoin_verify_binaries"

RUN set -ex \
  && if [ "${TARGETPLATFORM}" = "linux/amd64" ]; then export TARGETPLATFORM=x86_64-linux-gnu; fi \
  && if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then export TARGETPLATFORM=aarch64-linux-gnu; fi \
  && if [ "${TARGETPLATFORM}" = "linux/arm/v7" ]; then export TARGETPLATFORM=arm-linux-gnueabihf; fi \
  && git clone ${SIGS_REPO_URL} ${SIGS_CLONE_DIR} \
  && gpg --import "${SIGS_CLONE_DIR}"/builder-keys/* \
  && curl -o verify.py ${VERIFY_SCRIPT_URL} \
  && chmod +x verify.py \
  && ./verify.py \
    --min-good-sigs 6 pub "${BITCOIN_VERSION}-linux" \
  && tar -xzf "${TMPDIR}.${BITCOIN_VERSION}-linux/bitcoin-${BITCOIN_VERSION}-${TARGETPLATFORM}.tar.gz" -C /opt \
  && rm -rf ${SIGS_CLONE_DIR} \
  && rm -rf ${TMPDIR} \
  && rm -rf /opt/bitcoin-${BITCOIN_VERSION}/bin/bitcoin-qt

# Second stage
FROM ubuntu:24.04

ARG UID=101
ARG GID=101

# 设置环境变量
ENV USER=bitcoin

ENV BITCOIN_DATA=/home/bitcoin/.bitcoin
ENV BITCOIN_VERSION=27.0
ENV PATH=/opt/bitcoin-${BITCOIN_VERSION}/bin:$PATH

RUN groupadd --system --gid ${GID} ${USER} \
  && useradd --system --create-home --no-log-init -u ${UID} -g ${GID} ${USER} \
  && apt-get update -y \
  && apt-get install -y gosu --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=builder /opt/bitcoin-${BITCOIN_VERSION} /opt/bitcoin-${BITCOIN_VERSION}

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["/home/bitcoin/.bitcoin"]
EXPOSE 8332 8333 18332 18333 18443 18444 38333 38332

ENTRYPOINT ["/entrypoint.sh"]
RUN bitcoind -version | grep "Bitcoin Core version v${BITCOIN_VERSION}"
CMD ["bitcoind"]
