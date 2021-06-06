FROM alpine:3.13.5

RUN apk --no-cache add \
    dante-server \
    gettext

ENV SOCKS_PORT=1080 \
    SOCKS_INTERFACE_INTERNAL=eth0 \
    SOCKS_INTERFACE_EXTERNAL=eth0

COPY scripts /usr/local/bin
COPY conf /etc

ENTRYPOINT [ "entrypoint" ]
