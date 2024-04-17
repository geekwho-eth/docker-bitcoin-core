
# Bitcoin Core Docker Image
[![build](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/build.yaml/badge.svg)](https://github.com/geekwho-eth/docker-bitcoin-core/actions/workflows/build.yaml)
[![Docker Pulls](https://img.shields.io/docker/pulls/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Stars](https://img.shields.io/docker/stars/caijiamx/bitcoin-core.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)
[![Docker Image Size (latest)](https://img.shields.io/docker/image-size/caijiamx/bitcoin-core/latest.svg)](https://hub.docker.com/r/caijiamx/bitcoin-core)

This Docker image is built to run Bitcoin Core, leveraging a multi-stage build process.

## Bitcoin Core Tags

- `27.0-ubuntu`, `27-ubuntu`, `latest` ([27/ubuntu/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/27/ubuntu/Dockerfile))
- `27.0-debian`, `27-debian`, `latest` ([27/debian/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/27/debian/Dockerfile))
- `27.0-alpine`, `27-alpine` ([27/alpine/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/27/alpine/Dockerfile))
- `27.0-alpine-tor`, `27-alpine-tor` ([27/alpine/tor/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/27/alpine/tor/Dockerfile))

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
- Email: caijiamx@gmail.com

## Version Information

- Docker Image Version: 1.0
- Bitcoin Core Version: 27.0

## License

[MIT License](../LICENSE)