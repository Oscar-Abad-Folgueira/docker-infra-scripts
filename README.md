# docker-infra-scripts

Scripts para crear y operar infraestructuras Docker según el stack que quieras.

Stacks soportados:
- `laravel` (php-fpm + nginx + postgres)
- `node` (node dev server)
- `postgres` (postgres + adminer)

## Uso rápido

```bash
# 1) Crear infraestructura Laravel en un directorio nuevo
make create STACK=laravel TARGET=/Users/oscarabad/Docker/proyecto-a PROJECT=proyectoa WEB_PORT=8085 DB_PORT=54385

# 2) Levantar
make up TARGET=/Users/oscarabad/Docker/proyecto-a

# 3) Ver estado
make ps TARGET=/Users/oscarabad/Docker/proyecto-a

# 4) Bajar
make down TARGET=/Users/oscarabad/Docker/proyecto-a
```

## Ejemplos por stack

### Laravel
```bash
make create STACK=laravel TARGET=/ruta/proyecto PROJECT=canalx WEB_PORT=8080 DB_PORT=54322
```

### Node
```bash
make create STACK=node TARGET=/ruta/proyecto PROJECT=nodeapp APP_PORT=3001
```

### Postgres
```bash
make create STACK=postgres TARGET=/ruta/proyecto PROJECT=pgdata DB_PORT=54330 ADMINER_PORT=8089
```

## Bootstrap Laravel (opcional)

Si ya tienes tu app Laravel dentro de `src/`:

```bash
make bootstrap-laravel TARGET=/ruta/proyecto
```

Esto ejecuta: `composer install`, `.env`, `key:generate`, `migrate --seed`, `optimize:clear`.
