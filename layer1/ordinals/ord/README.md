# An Ordinals ORD Docker Image

This Docker image is built to run Bitcoin Core and ord.

# An Ordinals ORD Tags
- `ord-alpine` ([ord/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/ord/Dockerfile))

ord build by ordinals install.sh.

## Features

- Utilizes Alpine Linux for a lightweight base image.
- Non-root user (`ord`) for enhanced security.
- Automatic installation of required dependencies.
- Includes `libevent` and `libzmq` for improved performance.
- Supports configuration via `ord.yaml`.
- Exposes port `8080` for HTTP communication.

## Usage

1. **Build Image**:

   ```bash
   docker build -t ord-alpine .
   ```

2. **Run Bitcoin Core**:

   ```bash
   docker run -d --name ord-alpine \
       -v /path/to/:/home/ord/ \
       -p 8080:8080 \
       ord-alpine ord --config=/home/ord/ord.yaml --rpc-url=127.0.0.1:8332 server --http-port=8080
   ```

3. **Environment Variables**:

   - `UID`: User ID (default: `100`).
   - `GID`: Group ID (default: `101`).
   - `ORD_YAML`: Path to `ord.yaml` (default: `/home/ord/ord.yaml`).
   - `ORD_USER`: User name (default: `ord`).
   - `ORD_RPC_URL`: RPC URL (default: `127.0.0.1:8332`).

4. **Configuration**:

   Modify `ord.yaml` as per your requirements.

5. **Access Web Interface**:

   Open your browser and go to `http://localhost:8080`.

6. **Additional Information**:

   - [Bitcoin Core Documentation](https://bitcoin.org/en/bitcoin-core/)
   - [Ordinals GitHub Repository](https://github.com/ordinals/ord)

## Maintenance

For any issues or feedback, please contact the maintainer:

- Maintainer: GeekWho
- Email: caijiamx@gmail.com

## Version Information

- Docker Image Version: 1.0
- Bitcoin Core Version: [Specify Version]

## License

[MIT License](../LICENSE)