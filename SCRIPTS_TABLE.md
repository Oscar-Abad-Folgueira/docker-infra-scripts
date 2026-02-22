# Scripts Table

| Script | Category | What it does | Example |
|---|---|---|---|
| `scripts/create.sh` | Scaffolding | Generates docker files for selected stack | `make create STACK=wordpress TARGET=/Users/oscarabad/Docker/prueba1` |
| `scripts/create.sh` | Scaffolding | Supported stacks: `wordpress`, `laravel`, `node`, `nextjs`, `strapi`, `postgres` | `make create STACK=strapi TARGET=/Users/oscarabad/Docker/proj APP_PORT=1337 DB_PORT=54329` |
| `scripts/new-project.sh` | Scaffolding | Creates project directory and optionally clones repo | `make new-project TARGET=/Users/oscarabad/Docker/proj REPO=https://github.com/org/repo.git` |
| `scripts/stack-switch.sh` | Scaffolding | Regenerates infra as another stack | `make stack-switch TARGET=/Users/oscarabad/Docker/proj STACK=laravel` |
| `scripts/port-check.sh` | Scaffolding | Checks if requested ports are free | `make port-check ARGS="8080 5432 3306"` |
| `scripts/up.sh` | Ops | Starts containers | `make up TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/down.sh` | Ops | Stops containers | `make down TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/ps.sh` | Ops | Shows compose status | `make ps TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/logs.sh` | Ops | Tails compose logs | `make logs TARGET=/Users/oscarabad/Docker/proj SERVICE=app` |
| `scripts/restart.sh` | Ops | Restarts one or all services | `make restart TARGET=/Users/oscarabad/Docker/proj SERVICE=db` |
| `scripts/exec.sh` | Ops | Opens shell or runs command in a service | `./scripts/exec.sh /Users/oscarabad/Docker/proj app php -v` |
| `scripts/doctor.sh` | Ops | Validates docker/compose and service state | `make doctor TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/backup-db.sh` | Backup | Creates DB dump (Postgres or MySQL) | `make backup-db TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/restore-db.sh` | Backup | Restores DB dump | `make restore-db TARGET=/Users/oscarabad/Docker/proj BACKUP=/path/dump.sql` |
| `scripts/snapshot.sh` | Backup | Captures compose config, status and DB backup | `make snapshot TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/secrets-check.sh` | Security | Scans for likely secrets in repo | `make secrets-check TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/permissions-fix.sh` | Security | Fixes common Laravel writable dir permissions | `make permissions-fix TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/hardening-report.sh` | Security | Prints a basic hardening checklist | `make hardening-report TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/bootstrap-laravel.sh` | Laravel | Installs deps, env, key, migrate, clear cache | `make bootstrap-laravel TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/migrate-safe.sh` | Laravel | Runs DB backup then Laravel migrate | `make migrate-safe TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/queue-worker.sh` | Laravel | Starts queue worker | `make queue-worker TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/test-safe.sh` | Laravel | Runs tests in safe sqlite memory mode | `make test-safe TARGET=/Users/oscarabad/Docker/proj ARGS="--filter=Feature"` |
| `scripts/wp-install.sh` | WordPress | Installs WordPress via WP-CLI | `make wp-install TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/wp-plugin-sync.sh` | WordPress | Installs/activates plugins from CSV list | `make wp-plugin-sync TARGET=/Users/oscarabad/Docker/proj PLUGINS="classic-editor,wordfence"` |
| `scripts/wp-db-search-replace.sh` | WordPress | Rewrites DB URLs/text in WordPress | `make wp-db-search-replace TARGET=/Users/oscarabad/Docker/proj FROM=http://old TO=https://new` |
| `scripts/node-bootstrap.sh` | Node | install/lint/test/build local node project | `make node-bootstrap TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/node-dev-reset.sh` | Node | Cleans node caches and reinstalls | `make node-dev-reset TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/nextjs-bootstrap.sh` | Next.js | Installs deps and runs lint/test if available | `make nextjs-bootstrap TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/strapi-bootstrap.sh` | Strapi | Installs deps and prepares `.env` if possible | `make strapi-bootstrap TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/preflight.sh` | CI Local | Runs doctor + secrets + optional safe tests | `make preflight TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/release-tag.sh` | Release | Creates and pushes annotated git tag | `make release-tag VERSION=v1.2.0` |
