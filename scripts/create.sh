#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage:
  $0 --stack <wordpress|drupal|october|magento|prestashop|laravel|node|nextjs|strapi|postgres|mysql|mariadb|redis|mongodb|phpmyadmin|adminer|nginx|apache-php|python-fastapi|django|nestjs|react-vite|vue-vite|sveltekit> --target <dir> [--project <slug>] [--web-port 8080] [--db-port 5432] [--app-port 3000] [--adminer-port 8081]
USAGE
}

STACK=""
TARGET=""
PROJECT=""
WEB_PORT="8080"
DB_PORT="54322"
APP_PORT="3000"
ADMINER_PORT="8081"

while [ $# -gt 0 ]; do
  case "$1" in
    --stack) STACK="$2"; shift 2;;
    --target) TARGET="$2"; shift 2;;
    --project) PROJECT="$2"; shift 2;;
    --web-port) WEB_PORT="$2"; shift 2;;
    --db-port) DB_PORT="$2"; shift 2;;
    --app-port) APP_PORT="$2"; shift 2;;
    --adminer-port) ADMINER_PORT="$2"; shift 2;;
    -h|--help) usage; exit 0;;
    *) echo "Unknown arg: $1"; usage; exit 1;;
  esac
done

[ -n "$STACK" ] || { echo "Missing --stack"; usage; exit 1; }
[ -n "$TARGET" ] || { echo "Missing --target"; usage; exit 1; }

mkdir -p "$TARGET"
if [ -z "$PROJECT" ] || [ "$PROJECT" = "auto" ]; then
  PROJECT="$(basename "$TARGET" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/_/g; s/^_+//; s/_+$//')"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

render() {
  local src="$1" dst="$2"
  sed \
    -e "s/__PROJECT__/$PROJECT/g" \
    -e "s/__WEB_PORT__/$WEB_PORT/g" \
    -e "s/__DB_PORT__/$DB_PORT/g" \
    -e "s/__APP_PORT__/$APP_PORT/g" \
    -e "s/__ADMINER_PORT__/$ADMINER_PORT/g" \
    "$src" > "$dst"
}

case "$STACK" in
  laravel)
    mkdir -p "$TARGET/docker/app" "$TARGET/docker/nginx"
    render "$ROOT_DIR/templates/laravel/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    render "$ROOT_DIR/templates/laravel/Dockerfile.tpl" "$TARGET/docker/app/Dockerfile"
    render "$ROOT_DIR/templates/laravel/nginx.conf.tpl" "$TARGET/docker/nginx/default.conf"
    ;;
  node)
    render "$ROOT_DIR/templates/node/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  nextjs)
    render "$ROOT_DIR/templates/nextjs/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  strapi)
    render "$ROOT_DIR/templates/strapi/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  postgres)
    render "$ROOT_DIR/templates/postgres/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  wordpress)
    render "$ROOT_DIR/templates/wordpress/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  drupal)
    render "$ROOT_DIR/templates/drupal/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  october)
    render "$ROOT_DIR/templates/october/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  magento)
    render "$ROOT_DIR/templates/magento/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  prestashop)
    render "$ROOT_DIR/templates/prestashop/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  mysql)
    render "$ROOT_DIR/templates/mysql/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  mariadb)
    render "$ROOT_DIR/templates/mariadb/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  redis)
    render "$ROOT_DIR/templates/redis/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  mongodb)
    render "$ROOT_DIR/templates/mongodb/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  phpmyadmin)
    render "$ROOT_DIR/templates/phpmyadmin/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  adminer)
    render "$ROOT_DIR/templates/adminer/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  nginx)
    render "$ROOT_DIR/templates/nginx/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  apache-php)
    render "$ROOT_DIR/templates/apache-php/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  python-fastapi)
    render "$ROOT_DIR/templates/python-fastapi/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  django)
    render "$ROOT_DIR/templates/django/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  nestjs)
    render "$ROOT_DIR/templates/nestjs/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  react-vite)
    render "$ROOT_DIR/templates/react-vite/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  vue-vite)
    render "$ROOT_DIR/templates/vue-vite/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  sveltekit)
    render "$ROOT_DIR/templates/sveltekit/docker-compose.yml.tpl" "$TARGET/docker-compose.yml"
    ;;
  *)
    echo "Invalid --stack: $STACK"; exit 1;;
esac

echo "Created stack '$STACK' in $TARGET"
echo "Project slug: $PROJECT"
