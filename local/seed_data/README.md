# README

## Export secrets
```bash
export POSTGRES_PASSWORD=omegasecret
export SECRET_KEY_BASE=supersecret
export SYNTH_API_KEY=megasecret
```

## Restart maybe
```bash
docker compose down; docker compose up
docker compose exec app bash
```

## Enter rails-environment
```bash
bin/rails console
```
