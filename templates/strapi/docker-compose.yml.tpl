services:
  app:
    image: node:22-alpine
    container_name: __PROJECT___strapi
    working_dir: /workspace
    command: sh -lc "npm install && npm run develop"
    environment:
      NODE_ENV: development
      DATABASE_CLIENT: postgres
      DATABASE_HOST: db
      DATABASE_PORT: 5432
      DATABASE_NAME: __PROJECT__
      DATABASE_USERNAME: __PROJECT__
      DATABASE_PASSWORD: __PROJECT__
    volumes:
      - ./:/workspace:cached
    ports:
      - "__APP_PORT__:1337"
    depends_on:
      - db

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
