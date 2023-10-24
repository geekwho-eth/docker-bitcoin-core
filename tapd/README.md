# Lightning Taproot Assets Docker Image

This Docker image is based on [lightninglabs/taproot-assets](https://hub.docker.com/r/lightninglabs/taproot-assets) and adds some customizations.

# Lightning Taproot Assets Tags
- `taproot-assets-v0.3.0-alpha` ([tapd/Dockerfile](https://github.com/geekwho-eth/docker-bitcoin-core/blob/master/tapd/alpine/Dockerfile))

## Usage

### Pull the Docker Image

```bash
docker pull <image-name>:<tag>
```

### Run the Container

```bash
docker run --name my_tapd_node -d -p 10029:10029 -v /path/to/local/tapd/data:/home/tapd/.tapd <image-name>:<tag>
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

- `USER_HOME`: Home directory for the `tapd` user.
- `USER_NAME`: Name of the user (default: `tapd`).
- `USER_GROUP`: Name of the user group (default: `tapd`).

## Author

Maintained by GeekWho (<caijiamx@gmail.com>)

## Version

1.0

## Description

This image extends the base [lightninglabs/taproot-assets](https://hub.docker.com/r/lightninglabs/taproot-assets) image to add some customizations.

## License

[MIT License](../LICENSE)