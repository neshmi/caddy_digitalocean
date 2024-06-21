ARG ARCH
ARG VERSION
FROM --platform ${ARCH} caddy:${VERSION}-builder AS builder

RUN xcaddy build "${VERSION}" --with github.com/caddy-dns/digitalocean@master

FROM --platform ${ARCH} caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
