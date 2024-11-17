# geekwho-eth/bitcoin-core

This is a project that includes multiple images, each with its own features and usage.

## Image List

- [Bitcoin Core Docker Image](27/README.md)
- [Lightning network Images](layer2/lightning_network/README.md)

## Bitcoin Core Docker Image

[![bitcoin_core](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/bitcoin_core.yaml/badge.svg)](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/bitcoin_core.yaml)
[![Docker Pulls](https://img.shields.io/docker/pulls/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Stars](https://img.shields.io/docker/stars/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Image Size (latest)](https://img.shields.io/docker/image-size/caijiamx/bitcoin-core/latest.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)

This Docker image is built to run Bitcoin Core, leveraging a multi-stage build process.

Highlight:
1. Build the image based on the alpine image.
2. Run lnd as a non-root user.
3. Resolve the user home directory permissions issue.

[More Details](27/README.md)