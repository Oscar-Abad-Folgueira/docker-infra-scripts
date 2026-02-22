# docker-infra-scripts

Scripts para crear y operar infraestructuras Docker por stack.

Stacks soportados:
- `wordpress`
- `laravel`
- `node`
- `postgres`

## Flujo que quieres (paso a paso)

```bash
# 1) Crear directorio del proyecto
cd /Users/oscarabad/Docker
mkdir -p prueba1
cd prueba1

# 2) Abrir VS Code en ese directorio
code .

# 3) Clonar este repo de scripts dentro del proyecto
git clone https://github.com/Oscar-Abad-Folgueira/docker-infra-scripts.git

# 4) Generar infraestructura Docker según stack
cd docker-infra-scripts
make create STACK=wordpress TARGET=/Users/oscarabad/Docker/prueba1 WEB_PORT=8088 DB_PORT=33088 ADMINER_PORT=8089
# o
make create STACK=laravel TARGET=/Users/oscarabad/Docker/prueba1 WEB_PORT=8088 DB_PORT=54388
# o
make create STACK=node TARGET=/Users/oscarabad/Docker/prueba1 APP_PORT=3008
# o
make create STACK=postgres TARGET=/Users/oscarabad/Docker/prueba1 DB_PORT=54388 ADMINER_PORT=8089

# 5) Levantar contenedores
make up TARGET=/Users/oscarabad/Docker/prueba1

# 6) Ver estado
make ps TARGET=/Users/oscarabad/Docker/prueba1

# 7) Parar
make down TARGET=/Users/oscarabad/Docker/prueba1
```

## Comandos

- Crear infraestructura: `make create STACK=<stack> TARGET=<ruta> [PROJECT=<slug>]`
- Levantar: `make up TARGET=<ruta>`
- Parar: `make down TARGET=<ruta>`
- Estado: `make ps TARGET=<ruta>`
- Logs: `make logs TARGET=<ruta> [SERVICE=app]`
- Bootstrap Laravel (si tienes app en `src/`): `make bootstrap-laravel TARGET=<ruta>`

## Variables por defecto

- `PROJECT=auto` (usa el nombre del directorio objetivo)
- `WEB_PORT=8080`
- `DB_PORT=54322`
- `APP_PORT=3000`
- `ADMINER_PORT=8081`
