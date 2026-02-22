services:
  app:
    image: octobercms/october:latest
    container_name: __PROJECT___october
    depends_on:
      - db
    ports:
      - "__WEB_PORT__:80"
    environment:
      DB_CONNECTION: mysql
      DB_HOST: db
      DB_PORT: 3306
      DB_DATABASE: __PROJECT__
      DB_USERNAME: __PROJECT__
      DB_PASSWORD: __PROJECT__

  db:
    image: mariadb:11
    container_name: __PROJECT___db
    environment:
      MARIADB_DATABASE: __PROJECT__
      MARIADB_USER: __PROJECT__
      MARIADB_PASSWORD: __PROJECT__
      MARIADB_ROOT_PASSWORD: __PROJECT___root
    ports:
      - "__DB_PORT__:3306"
    volumes:
      - __PROJECT___db:/var/lib/mysql

volumes:
  __PROJECT___db:
