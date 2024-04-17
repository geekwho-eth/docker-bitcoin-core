# Lightning LND Docker Image

This Docker image is based on [lightninglabs/lnd](https://hub.docker.com/r/lightninglabs/lnd) and adds some customizations.

# Lightning LND Tags
- `lnd-v0.17.0-beta` ([lnd/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/lnd/alpine/Dockerfile))

## Usage

### Pull the Docker Image

```bash
docker pull <image-name>:<tag>
```

### Run the Container

```bash
docker run --name my_lnd_node -d -p 9735:9735 -v /path/to/local/lnd/data:/home/lnd/.lnd <image-name>:<tag>
```

### Customization

You can customize the UID and GID of the user inside the container by specifying `HOST_UID` and `HOST_GID` build arguments.

For example:

```bash
docker build --build-arg HOST_UID=1001 --build-arg HOST_GID=1002 -t <image-name>:<tag> .
```

### Entrypoint

The entrypoint script is provided in `docker-entrypoint.sh`. It sets up user permissions and starts the LND daemon.

## Build

To build the Docker image, use the following command:

```bash
docker build -t <image-name>:<tag> .
```

## Environment Variables

- `USER_HOME`: Home directory for the `lnd` user.
- `USER_NAME`: Name of the user (default: `lnd`).
- `USER_GROUP`: Name of the user group (default: `lnd`).

## Author

Maintained by GeekWho (<caijiamx@gmail.com>)

## Version

1.0

## Description

This image extends the base [lightninglabs/lnd](https://hub.docker.com/r/lightninglabs/lnd) image to add some customizations.

## License

[MIT License](../LICENSE)