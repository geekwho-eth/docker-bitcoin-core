
# Bitcoin Core Docker Image
[![bitcoin_core](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/bitcoin_core.yaml/badge.svg)](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/bitcoin_core.yaml)
[![Docker Pulls](https://img.shields.io/docker/pulls/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Stars](https://img.shields.io/docker/stars/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Image Size (latest)](https://img.shields.io/docker/image-size/caijiamx/bitcoin-core/latest.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)

This Docker image is built to run Bitcoin Core, leveraging a multi-stage build process.

## Bitcoin Core Tags

- `26.0-ubuntu`, `26-ubuntu`, `latest` ([26/ubuntu/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/26/ubuntu/Dockerfile))
- `26.0-debian`, `26-debian`, `latest` ([26/debian/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/26/debian/Dockerfile))
- `26.0-alpine`, `26-alpine` ([26/alpine/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/26/alpine/Dockerfile))

Origin README.md pls see [ruimarinho/docker-bitcoin-core](https://github.com/ruimarinho/docker-bitcoin-core/blob/master/README.md)

## Features

- Utilizes Alpine Linux for a lightweight base image.
- Automatic installation of required dependencies.
- Utilizes BerkeleyDB for data storage.
- Supports configuration via `bitcoin.conf`.
- Exposes ports for communication (8332, 8333, 18332, 18333, 18444).

## Build Stages

### BerkeleyDB

- Downloads and compiles BerkeleyDB for data storage.

### Bitcoin Core

- Downloads Bitcoin Core source code and verifies its integrity.
- Compiles Bitcoin Core with specified configurations.

### Final Stage

- Sets up non-root user `bitcoin` for enhanced security.
- Exposes necessary ports for Bitcoin Core operation.

## Usage

1. **Build Image**:

   ```bash
   docker build -t bitcoin-core .
   ```

2. **Run Bitcoin Core**:

   ```bash
   docker run -d --name bitcoin-core \
       -v /path/to/bitcoin.conf:/home/bitcoin/.bitcoin/bitcoin.conf \
       -p 8332:8332 \
       -p 8333:8333 \
       -p 18332:18332 \
       -p 18333:18333 \
       -p 18444:18444 \
       bitcoin-core
   ```

3. **Configuration**:

   Modify `bitcoin.conf` as per your requirements.

4. **Access Web Interface**:

   Open your browser and go to `http://localhost:8332`.

5. **Additional Information**:

   - [Bitcoin Core Documentation](https://bitcoin.org/en/bitcoin-core/)

## Maintenance

For any issues or feedback, please contact the maintainer:

- Maintainer: GeekWho
- Email: geekwho_eth@outlook.com

## Version Information

- Docker Image Version: 1.0
- Bitcoin Core Version: 26.0

## License

[MIT License](../LICENSE)