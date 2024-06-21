ARG TARGETARCH
ARG VERSION
FROM --platform=${TARGETARCH} caddy:${VERSION}-builder AS builder

RUN xcaddy build "${VERSION}" --with github.com/caddy-dns/digitalocean@master

FROM --platform=${TARGETARCH} caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
