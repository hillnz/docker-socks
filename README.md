# socks

SOCKS proxy server (using [Dante](https://www.inet.no/dante/)).

There's very little to this container. It just runs Dante with a trivial configuration file.

## Why?

It's sometimes useful to configure network traffic at an application level. For example, individual applications in other containers (or on the host) could send traffic through this container's network.

## Usage

If you want to you can expose a port (1080) so that other systems can access the service. Be careful with this, there's no authentication configured by default.
Otherwise if you attach this container to a docker network then other services will be able to access the service by its container name, at port 1080.

## Tags

Tags are created based on the Dante version, or you can use `latest`.
Updates are created when new versions of the upstream image (Alpine) are released.

### Ports

Pass ports for `docker-compose` in `ports` or to `docker run` with `-p <host_port>:<container_port>`.

| Container Port | Description |
|---|---|
| 1080 | SOCKS5 Server |

### Environment Variables

Pass values for `docker-compose` in `environment` or to `docker run` with `-e "<VAR_NAME>:<value>"`.
These values will only take effect if you haven't mounted your own sockd.conf.

| Variable | Default | Example | Description |
|---|---|---|---|
| `SOCKS_PORT` | `1080` | `1234` | SOCKS proxy listening port |
| `SOCKS_INTERFACE_INTERNAL` | `eth0` | `eth1` | SOCKS proxy internal listening interface |
| `SOCKS_INTERFACE_EXTERNAL` | `eth0` | `eth1` | SOCKS proxy external interface |

### Mounts

There are no volumes defined, but if you want to you can override the default Dante configuration by mounting your own to `/etc/sockd.conf`.

## Motivation

There are other very similar images available, but I wanted one that was multi-architecture and frequently updated.
