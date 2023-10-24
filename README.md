# geekwho-eth/bitcoin-core

This is a project that includes multiple images, each with its own features and usage.

## Image List

- [Bitcoin Core Docker Image](25/README.md)
- [Ord Docker Image](ord/README.md)
- [Lnd Images](lnd/README.md)
- [Taproot Assets Images](tapd/README.md)

## Bitcoin Core Docker Image

[![build](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/build.yaml/badge.svg)](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/build.yaml)
[![Docker Pulls](https://img.shields.io/docker/pulls/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Stars](https://img.shields.io/docker/stars/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Image Size (latest)](https://img.shields.io/docker/image-size/caijiamx/bitcoin-core/latest.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)

This Docker image is built to run Bitcoin Core, leveraging a multi-stage build process.

Highlight:
1. Build the image based on the alpine image.
2. Run lnd as a non-root user.
3. Resolve the user home directory permissions issue.

[More Details](25/README.md)

## Ordinals Ord Docker Image

This Docker image is built to run ordinals ord.

Highlight:
1. Build the image based on the alpine image.
2. Run lnd as a non-root user.
3. Resolve the user home directory permissions issue.

[More Details](ord/README.md)

## Lightning LND Docker Image

This Docker image is based on [lightninglabs/lnd](https://hub.docker.com/r/lightninglabs/lnd) and adds some customizations.

Highlight:
1. Build the image based on the lightninglabs/lnd image.
2. Run lnd as a non-root user.
3. Resolve the user home directory permissions issue.

[More Details](lnd/README.md)

## Lightning Taproot Assets Docker Image

This Docker image is based on [lightninglabs/taproot-assets](https://hub.docker.com/r/lightninglabs/taproot-assets) and adds some customizations.

Highlight:
1. Build the image based on the lightninglabs/taproot-assets image.
2. Run lnd as a non-root user.
3. Resolve the user home directory permissions issue.

[More Details](tapd/README.md)
