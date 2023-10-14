# geekwho-eth/bitcoin-core

A bitcoin-core docker image with support for Directory structure as follows:

25
├── alpine
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
│   └── tor
│       ├── Dockerfile
│       ├── docker-entrypoint.sh
│       └── torrc
└── ubuntu
    ├── Dockerfile
    └── docker-entrypoint.sh

## Tags

- `25.0-ubuntu`, `25-ubuntu`, `latest` ([25/ubuntu/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/ubuntu/25/Dockerfile)) [**multi-arch**]
- `25.0-alpine`, `25-alpine` ([25/alpine/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/25/alpine/Dockerfile))
- `25.0-alpine-tor`, `25-alpine-tor` ([25/alpine/tor/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/25/alpine/tor/Dockerfile))

[![build](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/build.yaml/badge.svg)](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/build.yaml)

[![caijiamx/bitcoin-core][docker-pulls-image]][docker-hub-url] [![caijiamx/bitcoin-core][docker-stars-image]][docker-hub-url] [![caijiamx/bitcoin-core][docker-size-image]][docker-hub-url]


## Origin README.md
see [ruimarinho/docker-bitcoin-core](https://github.com/ruimarinho/docker-bitcoin-core/blob/master/README.md)