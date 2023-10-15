# geekwho-eth/bitcoin-core

A bitcoin-core docker image with support for Directory structure as follows:

```bash
25
├── alpine
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
│   └── tor
│       ├── Dockerfile
│       ├── docker-entrypoint.sh
│       └── torrc
└── debian
    ├── Dockerfile
    └── docker-entrypoint.sh
```

## Tags

- `25.0-debian`, `25-debian`, `latest` ([25/debian/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/25/debian/Dockerfile))
- `25.0-alpine`, `25-alpine` ([25/alpine/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/25/alpine/Dockerfile))
- `25.0-alpine-tor`, `25-alpine-tor` ([25/alpine/tor/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/25/alpine/tor/Dockerfile))

[![build](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/build.yaml/badge.svg)](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/build.yaml)
[![Docker Pulls](https://img.shields.io/docker/pulls/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Stars](https://img.shields.io/docker/stars/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Image Size (latest)](https://img.shields.io/docker/image-size/caijiamx/bitcoin-core/latest.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)


## Origin README.md
see [ruimarinho/docker-bitcoin-core](https://github.com/ruimarinho/docker-bitcoin-core/blob/master/README.md)