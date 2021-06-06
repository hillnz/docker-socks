FROM alpine:3.13.5

RUN apk --no-cache add \
    dante-server \
    gettext

ENV SOCKS_PORT=1080 \
    DANTE_CONF=/etc/sockd.conf

COPY scripts /usr/local/bin
COPY conf /etc

ENTRYPOINT [ "entrypoint" ]
