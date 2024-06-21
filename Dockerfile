ARG ARCH=
ARG VERSION=
ARG BUILD_VERSION="v${VERSION}"
FROM ${ARCH}caddy:${VERSION}-builder AS builder

RUN xcaddy build "${BUILD_VERSION}" --with github.com/caddy-dns/digitalocean@master

FROM ${ARCH}caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy