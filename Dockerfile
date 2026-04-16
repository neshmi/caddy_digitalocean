ARG VERSION
FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build "${VERSION}" \
  --with github.com/caddy-dns/digitalocean@master \
  --with github.com/protomaps/go-pmtiles/caddy \
  --with github.com/caddyserver/cache-handler \
  --with github.com/hslatman/caddy-crowdsec-bouncer/http

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
