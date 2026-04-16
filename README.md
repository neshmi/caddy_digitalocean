# caddy_digitalocean

Repository to generate a Caddy Docker image with these modules baked in:

- DigitalOcean DNS provider (`github.com/caddy-dns/digitalocean`)
- Cache handler (`github.com/caddyserver/cache-handler`)
- PMTiles (`github.com/protomaps/go-pmtiles/caddy`)
- CrowdSec HTTP bouncer (`github.com/hslatman/caddy-crowdsec-bouncer/http`)

## Build

```bash
docker build --build-arg VERSION=2.9.1 -t caddy-digitalocean-crowdsec .
```

## CrowdSec usage

Example Caddyfile snippet:

```caddyfile
example.com {
	crowdsec {
		api_url {$CROWDSEC_API_URL}
		api_key {$CROWDSEC_API_KEY}
	}

	reverse_proxy 127.0.0.1:8080
}
```

Set the following environment variables for Caddy:

- `CROWDSEC_API_URL` (for example: `http://crowdsec:8080`)
- `CROWDSEC_API_KEY` (bouncer API key generated in CrowdSec)
