services:
  mongo:
    image: mongo:8
    container_name: __PROJECT___mongo
    environment:
      MONGO_INITDB_ROOT_USERNAME: __PROJECT__
      MONGO_INITDB_ROOT_PASSWORD: __PROJECT___root
    ports:
      - "__DB_PORT__:27017"
    volumes:
      - __PROJECT___mongo:/data/db
volumes:
  __PROJECT___mongo:
