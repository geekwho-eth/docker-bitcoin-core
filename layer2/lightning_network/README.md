# geekwho-eth/bitcoin-core

This is a project that includes multiple images, each with its own features and usage.

## Image List

- [Lnd Images](lnd/README.md)
- [Taproot Assets Images](tapd/README.md)
- [Lightning Terminal Images](litd/README.md)

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

## Lightning Terminal Docker Image

This Docker image is based on [lightninglabs/lightning-terminal](https://hub.docker.com/r/lightninglabs/lightning-terminal) and adds some customizations.

Highlight:
1. Build the image based on the lightninglabs/lightning-terminal image.
2. Run lnd as a non-root user.
3. Resolve the user home directory permissions issue.

[More Details](litd/README.md)
