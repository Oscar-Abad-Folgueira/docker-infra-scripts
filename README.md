# docker-infra-scripts

Scripts para crear y operar infraestructuras Docker por stack.

Stacks soportados:
- `wordpress`
- `laravel`
- `node`
- `nextjs`
- `strapi`
- `postgres`

## Flujo rápido

```bash
cd /Users/oscarabad/Docker/prueba1
code .
git clone https://github.com/Oscar-Abad-Folgueira/docker-infra-scripts.git
cd docker-infra-scripts
```

Crear stack:

```bash
make create STACK=wordpress TARGET=/Users/oscarabad/Docker/prueba1 WEB_PORT=8088 DB_PORT=33088 ADMINER_PORT=8089
make create STACK=laravel   TARGET=/Users/oscarabad/Docker/prueba1 WEB_PORT=8088 DB_PORT=54388
make create STACK=node      TARGET=/Users/oscarabad/Docker/prueba1 APP_PORT=3008
make create STACK=nextjs    TARGET=/Users/oscarabad/Docker/prueba1 APP_PORT=3008
make create STACK=strapi    TARGET=/Users/oscarabad/Docker/prueba1 APP_PORT=1338 DB_PORT=54388
make create STACK=postgres  TARGET=/Users/oscarabad/Docker/prueba1 DB_PORT=54388 ADMINER_PORT=8089
```

Operación:

```bash
make up TARGET=/Users/oscarabad/Docker/prueba1
make ps TARGET=/Users/oscarabad/Docker/prueba1
make logs TARGET=/Users/oscarabad/Docker/prueba1 SERVICE=app
make down TARGET=/Users/oscarabad/Docker/prueba1
```

Bootstrap opcional:

```bash
make bootstrap-laravel TARGET=/Users/oscarabad/Docker/prueba1
make nextjs-bootstrap TARGET=/Users/oscarabad/Docker/prueba1
make strapi-bootstrap TARGET=/Users/oscarabad/Docker/prueba1
```

Resumen completo de scripts: `SCRIPTS_TABLE.md`.
