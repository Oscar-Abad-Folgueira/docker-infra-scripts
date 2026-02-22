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

  adminer:
    image: adminer:4
    container_name: __PROJECT___adminer
    depends_on:
      - db
    ports:
      - "__WEB_PORT__:8080"
