services:
  app:
    build:
      context: .
      dockerfile: docker/app/Dockerfile
    container_name: __PROJECT___app
    working_dir: /var/www/html
    volumes:
      - ./:/var/www/html:cached
    environment:
      APP_ENV: local
      APP_DEBUG: "true"
      DB_CONNECTION: pgsql
      DB_HOST: db
      DB_PORT: 5432
      DB_DATABASE: __PROJECT__
      DB_USERNAME: __PROJECT__
      DB_PASSWORD: __PROJECT__
    depends_on:
      - db

  web:
    image: nginx:1.27-alpine
    container_name: __PROJECT___web
    ports:
      - "__WEB_PORT__:80"
    volumes:
      - ./:/var/www/html:cached
      - ./docker/nginx/default.conf:/etc/nginx/conf.d/default.conf:ro
    depends_on:
      - app

  db:
    image: postgres:16-alpine
    container_name: __PROJECT___db
    environment:
      POSTGRES_DB: __PROJECT__
      POSTGRES_USER: __PROJECT__
      POSTGRES_PASSWORD: __PROJECT__
    ports:
      - "__DB_PORT__:5432"
    volumes:
      - __PROJECT___pg:/var/lib/postgresql/data

volumes:
  __PROJECT___pg:
