TARGET ?= .
STACK ?= laravel
PROJECT ?= auto
WEB_PORT ?= 8080
DB_PORT ?= 54322
APP_PORT ?= 3000
ADMINER_PORT ?= 8081

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
