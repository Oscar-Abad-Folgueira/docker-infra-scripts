# docker-infra-scripts

Scripts para crear y operar infraestructuras Docker por tipo de proyecto.

Tipos soportados:
- `wordpress`, `drupal`, `october`, `magento`, `prestashop`
- `laravel`, `node`, `nextjs`, `strapi`, `nestjs`
- `python-fastapi`, `django`
- `react-vite`, `vue-vite`, `sveltekit`
- `postgres`, `mysql`, `mariadb`, `redis`, `mongodb`
- `phpmyadmin`, `adminer`, `nginx`, `apache-php`

## Flujo rápido

```bash
cd /Users/oscarabad/Docker/prueba1
code .
git clone https://github.com/Oscar-Abad-Folgueira/docker-infra-scripts.git
cd docker-infra-scripts
```

Crear infraestructura (ejemplos):

```bash
make create STACK=wordpress     TARGET=/Users/oscarabad/Docker/prueba1 WEB_PORT=8088 DB_PORT=33088
make create STACK=laravel       TARGET=/Users/oscarabad/Docker/prueba1 WEB_PORT=8088 DB_PORT=54388
make create STACK=nextjs        TARGET=/Users/oscarabad/Docker/prueba1 APP_PORT=3008
make create STACK=strapi        TARGET=/Users/oscarabad/Docker/prueba1 APP_PORT=1338 DB_PORT=54388
make create STACK=postgres      TARGET=/Users/oscarabad/Docker/prueba1 DB_PORT=54388
make create STACK=mysql         TARGET=/Users/oscarabad/Docker/prueba1 DB_PORT=33088
make create STACK=redis         TARGET=/Users/oscarabad/Docker/prueba1 DB_PORT=63790
make create STACK=mongodb       TARGET=/Users/oscarabad/Docker/prueba1 DB_PORT=27018
make create STACK=python-fastapi TARGET=/Users/oscarabad/Docker/prueba1 APP_PORT=8008
make create STACK=django        TARGET=/Users/oscarabad/Docker/prueba1 APP_PORT=8008
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
