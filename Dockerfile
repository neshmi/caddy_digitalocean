ARG VERSION
FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build "${VERSION}" \
  --with github.com/caddy-dns/digitalocean@master \
  --with github.com/protomaps/go-pmtiles/caddy \
  --with github.com/caddyserver/cache-handler \
  --with github.com/hslatman/caddy-crowdsec-bouncer/http@main \
  --with github.com/hslatman/caddy-crowdsec-bouncer/appsec@main \
  --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@main

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
