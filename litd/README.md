# Lightning Terminal Docker Image

This Docker image is based on [lightninglabs/lightning-terminal](https://hub.docker.com/r/lightninglabs/lightning-terminal) and adds some customizations.

# Lightning Terminal Tags
- `taproot-terminal-v0.12.0-alpha` ([litd/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/litd/alpine/Dockerfile))

## Usage

### Pull the Docker Image

```bash
docker pull <image-name>:<tag>
```

### Run the Container

```bash
docker run --name my_litd_node -d -p 0.0.0.0:10029:10029 -p 0.0.0.0:8443:8443 -v /path/to/local/litd/data:/home/litd/.lit <image-name>:<tag>
```

### Customization

You can customize the UID and GID of the user inside the container by specifying `HOST_UID` and `HOST_GID` build arguments.

For example:

```bash
docker build --build-arg HOST_UID=1001 --build-arg HOST_GID=1002 -t <image-name>:<tag> .
```

### Entrypoint

The entrypoint script is provided in `docker-entrypoint.sh`. It sets up user permissions and starts the Taproot Assets daemon.

## Build

To build the Docker image, use the following command:

```bash
docker build -t <image-name>:<tag> .
```

## Environment Variables

- `USER_HOME`: Home directory for the `litd` user.
- `USER_NAME`: Name of the user (default: `litd`).
- `USER_GROUP`: Name of the user group (default: `litd`).

## Author

Maintained by GeekWho (<caijiamx@gmail.com>)

## Version

1.0

## Description

This image extends the base [lightninglabs/lightning-terminal](https://hub.docker.com/r/lightninglabs/lightning-terminal) image to add some customizations.

## License

[MIT License](../LICENSE)