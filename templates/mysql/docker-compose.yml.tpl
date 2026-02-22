services:
  db:
    image: mysql:8.4
    container_name: __PROJECT___mysql
    environment:
      MYSQL_DATABASE: __PROJECT__
      MYSQL_USER: __PROJECT__
      MYSQL_PASSWORD: __PROJECT__
      MYSQL_ROOT_PASSWORD: __PROJECT___root
    ports:
      - "__DB_PORT__:3306"
    volumes:
      - __PROJECT___mysql:/var/lib/mysql
volumes:
  __PROJECT___mysql:
