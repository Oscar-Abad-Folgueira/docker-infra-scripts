services:
  db:
    image: mariadb:11
    container_name: __PROJECT___mariadb
    environment:
      MARIADB_DATABASE: __PROJECT__
      MARIADB_USER: __PROJECT__
      MARIADB_PASSWORD: __PROJECT__
      MARIADB_ROOT_PASSWORD: __PROJECT___root
    ports:
      - "__DB_PORT__:3306"
    volumes:
      - __PROJECT___mariadb:/var/lib/mysql
volumes:
  __PROJECT___mariadb:
