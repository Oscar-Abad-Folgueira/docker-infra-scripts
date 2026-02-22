# Tabla de Scripts

| Script | Categoría | Qué hace | Ejemplo |
|---|---|---|---|
| `scripts/create.sh` | Estructura | Genera archivos Docker según el stack elegido | `make create STACK=wordpress TARGET=/Users/oscarabad/Docker/prueba1` |
| `scripts/create.sh` | Estructura | Stacks soportados: `wordpress`, `drupal`, `october`, `magento`, `prestashop`, `laravel`, `node`, `nextjs`, `strapi`, `nestjs`, `python-fastapi`, `django`, `react-vite`, `vue-vite`, `sveltekit`, `postgres`, `mysql`, `mariadb`, `redis`, `mongodb`, `phpmyadmin`, `adminer`, `nginx`, `apache-php` | `make create STACK=magento TARGET=/Users/oscarabad/Docker/proj WEB_PORT=8088 DB_PORT=33088` |
| `scripts/new-project.sh` | Estructura | Crea directorio de proyecto y opcionalmente clona un repositorio | `make new-project TARGET=/Users/oscarabad/Docker/proj REPO=https://github.com/org/repo.git` |
| `scripts/stack-switch.sh` | Estructura | Regenera la infraestructura cambiando de stack | `make stack-switch TARGET=/Users/oscarabad/Docker/proj STACK=laravel` |
| `scripts/port-check.sh` | Estructura | Comprueba si los puertos están libres | `make port-check ARGS="8080 5432 3306"` |
| `scripts/up.sh` | Operación | Arranca contenedores | `make up TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/down.sh` | Operación | Para contenedores | `make down TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/ps.sh` | Operación | Muestra estado de servicios | `make ps TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/logs.sh` | Operación | Muestra logs en tiempo real | `make logs TARGET=/Users/oscarabad/Docker/proj SERVICE=app` |
| `scripts/restart.sh` | Operación | Reinicia uno o todos los servicios | `make restart TARGET=/Users/oscarabad/Docker/proj SERVICE=db` |
| `scripts/exec.sh` | Operación | Abre shell o ejecuta comando dentro de un servicio | `./scripts/exec.sh /Users/oscarabad/Docker/proj app php -v` |
| `scripts/doctor.sh` | Operación | Diagnóstico rápido de Docker/Compose y servicios | `make doctor TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/backup-db.sh` | Backups | Crea copia de base de datos (Postgres o MySQL) | `make backup-db TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/restore-db.sh` | Backups | Restaura una copia SQL en la base de datos | `make restore-db TARGET=/Users/oscarabad/Docker/proj BACKUP=/path/dump.sql` |
| `scripts/snapshot.sh` | Backups | Guarda snapshot con configuración, estado y backup DB | `make snapshot TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/secrets-check.sh` | Seguridad | Busca posibles secretos en el repositorio | `make secrets-check TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/permissions-fix.sh` | Seguridad | Corrige permisos típicos de escritura en Laravel | `make permissions-fix TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/hardening-report.sh` | Seguridad | Informe básico de endurecimiento | `make hardening-report TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/bootstrap-laravel.sh` | Laravel | Instala dependencias, `.env`, key, migraciones y limpia caché | `make bootstrap-laravel TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/migrate-safe.sh` | Laravel | Ejecuta backup previo y luego migraciones | `make migrate-safe TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/queue-worker.sh` | Laravel | Arranca worker de colas | `make queue-worker TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/test-safe.sh` | Laravel | Ejecuta tests en modo seguro con sqlite en memoria | `make test-safe TARGET=/Users/oscarabad/Docker/proj ARGS="--filter=Feature"` |
| `scripts/wp-install.sh` | WordPress | Instala WordPress con WP-CLI | `make wp-install TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/wp-plugin-sync.sh` | WordPress | Instala/activa plugins desde lista CSV | `make wp-plugin-sync TARGET=/Users/oscarabad/Docker/proj PLUGINS="classic-editor,wordfence"` |
| `scripts/wp-db-search-replace.sh` | WordPress | Reemplaza URLs/textos en base de datos WordPress | `make wp-db-search-replace TARGET=/Users/oscarabad/Docker/proj FROM=http://old TO=https://new` |
| `scripts/node-bootstrap.sh` | Node | Instala dependencias y ejecuta lint/test/build si existen | `make node-bootstrap TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/node-dev-reset.sh` | Node | Limpia cachés de Node y reinstala dependencias | `make node-dev-reset TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/nextjs-bootstrap.sh` | Next.js | Instala dependencias y ejecuta lint/test si existen | `make nextjs-bootstrap TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/strapi-bootstrap.sh` | Strapi | Instala dependencias y prepara `.env` si aplica | `make strapi-bootstrap TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/preflight.sh` | Calidad local | Ejecuta revisión previa (doctor + secretos + tests seguros) | `make preflight TARGET=/Users/oscarabad/Docker/proj` |
| `scripts/release-tag.sh` | Release | Crea y publica una etiqueta git anotada | `make release-tag VERSION=v1.2.0` |
