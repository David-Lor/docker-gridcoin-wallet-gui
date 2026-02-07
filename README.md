# Gridcoin Wallet - Docker GUI Image

The Gridcoin Wallet in a Docker container, based on the [jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui).

This image is built for linux/amd64 & linux/arm64.

## Quickstart

```bash
docker volume create --name=gridcoin-wallet-data
docker run -d -p 5800:5800 -e VNC_PASSWORD=foo --name=gridcoin-wallet -v gridcoin-wallet-data:/config ghcr.io/david-lor/gridcoin-wallet-gui:latest
```

With this command you will:

- Create and run in background, a new Docker container with name `gridcoin-wallet`
- Have access to http://localhost:5800 where the Gridcoin Wallet can be accessed from
  - Use the VNC_PASSWORD `foo`
- Persist the wallet data & blockchain in the volume `gridcoin-wallet-data`, mounted in container `/config` (which is the HOME)

See the [base image environment variables](https://github.com/jlesage/docker-baseimage-gui?tab=readme-ov-file#public-environment-variables) for more useful customizations of the container.
