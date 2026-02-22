services:
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

  adminer:
    image: adminer:4
    container_name: __PROJECT___adminer
    ports:
      - "__ADMINER_PORT__:8080"
    depends_on:
      - db

volumes:
  __PROJECT___pg:
