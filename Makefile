TARGET ?= .
STACK ?= laravel
PROJECT ?= auto
WEB_PORT ?= 8080
DB_PORT ?= 54322
APP_PORT ?= 3000
ADMINER_PORT ?= 8081
SERVICE ?= app
REPO ?=
ARGS ?=
BACKUP ?=
FROM ?=
TO ?=
PLUGINS ?=
VERSION ?=

create:
	./scripts/create.sh --stack $(STACK) --target $(TARGET) --project $(PROJECT) --web-port $(WEB_PORT) --db-port $(DB_PORT) --app-port $(APP_PORT) --adminer-port $(ADMINER_PORT)

up:
	./scripts/up.sh $(TARGET)

down:
	./scripts/down.sh $(TARGET)

ps:
	./scripts/ps.sh $(TARGET)

logs:
	./scripts/logs.sh $(TARGET) $(SERVICE)

bootstrap-laravel:
	./scripts/bootstrap-laravel.sh $(TARGET)

new-project:
	./scripts/new-project.sh $(TARGET) $(REPO)

port-check:
	./scripts/port-check.sh $(ARGS)

stack-switch:
	./scripts/stack-switch.sh $(TARGET) $(STACK) $(PROJECT)

restart:
	./scripts/restart.sh $(TARGET) $(SERVICE)

exec:
	./scripts/exec.sh $(TARGET) $(SERVICE)

doctor:
	./scripts/doctor.sh $(TARGET)

backup-db:
	./scripts/backup-db.sh $(TARGET)

restore-db:
	./scripts/restore-db.sh $(TARGET) $(BACKUP)

snapshot:
	./scripts/snapshot.sh $(TARGET)

secrets-check:
	./scripts/secrets-check.sh $(TARGET)

permissions-fix:
	./scripts/permissions-fix.sh $(TARGET)

hardening-report:
	./scripts/hardening-report.sh $(TARGET)

migrate-safe:
	./scripts/migrate-safe.sh $(TARGET)

queue-worker:
	./scripts/queue-worker.sh $(TARGET)

test-safe:
	./scripts/test-safe.sh $(TARGET) $(ARGS)

wp-install:
	./scripts/wp-install.sh $(TARGET)

wp-plugin-sync:
	./scripts/wp-plugin-sync.sh $(TARGET) $(PLUGINS)

wp-db-search-replace:
	./scripts/wp-db-search-replace.sh $(TARGET) $(FROM) $(TO)

node-bootstrap:
	./scripts/node-bootstrap.sh $(TARGET)

node-dev-reset:
	./scripts/node-dev-reset.sh $(TARGET)

nextjs-bootstrap:
	./scripts/nextjs-bootstrap.sh $(TARGET)

strapi-bootstrap:
	./scripts/strapi-bootstrap.sh $(TARGET)

preflight:
	./scripts/preflight.sh $(TARGET)

release-tag:
	./scripts/release-tag.sh $(VERSION)
