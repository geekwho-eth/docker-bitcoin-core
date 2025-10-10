# Build stage for Bitcoin Core
FROM alpine:3.22 as bitcoin-core

RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add ccache
RUN apk --no-cache add cmake
RUN apk --no-cache add clang18
RUN apk --no-cache add boost-dev
RUN apk --no-cache add build-base
RUN apk --no-cache add chrpath
RUN apk --no-cache add file
RUN apk --no-cache add gnupg
RUN apk --no-cache add git
RUN apk --no-cache add libevent-dev
RUN apk --no-cache add libressl
RUN apk --no-cache add libtool
RUN apk --no-cache add linux-headers
RUN apk --no-cache add sqlite-dev
RUN apk --no-cache add zeromq-dev

ENV BITCOIN_VERSION=30.0
ENV BITCOIN_PREFIX=/opt/bitcoin-${BITCOIN_VERSION}
ENV BITCOIN_SOURCE_DIR=/bitcoin/src
ENV SIGS_REPO_URL="https://github.com/bitcoin-core/guix.sigs.git"
ENV SIGS_CLONE_DIR="guix.sigs"
ENV VERIFY_SCRIPT_URL="https://github.com/bitcoin/bitcoin/raw/master/contrib/verify-binaries/verify.py"

WORKDIR /bitcoin
RUN set -ex \
  && wget https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}.tar.gz \
  && wget https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/SHA256SUMS \
  && wget https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/SHA256SUMS.asc \
  && git clone ${SIGS_REPO_URL} ${SIGS_CLONE_DIR} \
  && gpg --import "${SIGS_CLONE_DIR}"/builder-keys/* \
  && wget -O verify.py ${VERIFY_SCRIPT_URL} \
  && chmod +x verify.py \
  && ./verify.py bin SHA256SUMS \
  "bitcoin-${BITCOIN_VERSION}.tar.gz" \
  && mkdir -p ${BITCOIN_SOURCE_DIR} \
  && tar -xzf "bitcoin-${BITCOIN_VERSION}.tar.gz" -C ${BITCOIN_SOURCE_DIR} \
  && rm -rf ${SIGS_CLONE_DIR}

WORKDIR "${BITCOIN_SOURCE_DIR}/bitcoin-${BITCOIN_VERSION}"

# use cmake build 
# https://github.com/bitcoin-core/bitcoin-devwiki/wiki/Autotools-to-CMake-Options-Mapping

RUN cmake -B build \
  -DBUILD_TESTS=OFF \
  -DBUILD_BENCH=OFF \
  -DWITH_CCACHE=ON \
  -DBUILD_GUI=OFF \
  -DBUILD_CLI=ON \
  -DBUILD_TX=ON \
  -DBUILD_UTIL=ON \
  -DENABLE_WALLET=ON \
  -DBUILD_DAEMON=ON \
  # CMAKE VAR
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_CXX_COMPILER=clang++-18 \
  -DCMAKE_C_COMPILER=clang-18 \
  -DCMAKE_INSTALL_PREFIX:PATH="${BITCOIN_PREFIX}" && \
  cmake --build build -j$(nproc) && \
  strip build/bin/bitcoin-cli build/bin/bitcoin-tx build/bin/bitcoind && \
  cmake --install build

# Build stage for compiled artifacts
FROM alpine:3.21

ARG UID=100
ARG GID=101

# 设置环境变量
ENV USER=bitcoin

LABEL maintainer="GeekWho <caijiamx@gmail.com>"
LABEL version="1.0"
LABEL description="A bitcoin-core docker image"

RUN addgroup ${USER} --gid ${GID} --system
RUN adduser --uid ${UID} --system ${USER} --ingroup ${USER}
RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add \
  libevent \
  libzmq \
  shadow \
  sqlite-dev \
  su-exec

ENV BITCOIN_DATA=/home/bitcoin/.bitcoin
ENV BITCOIN_VERSION=30.0
ENV BITCOIN_PREFIX=/opt/bitcoin-${BITCOIN_VERSION}
ENV PATH=${BITCOIN_PREFIX}/bin:$PATH

COPY --from=bitcoin-core /opt /opt
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["/home/bitcoin/.bitcoin"]

EXPOSE 8332 8333 18332 18333 18444

ENTRYPOINT ["/entrypoint.sh"]

RUN bitcoind -version | grep "Bitcoin Core daemon version v${BITCOIN_VERSION}"

CMD ["bitcoind"]
