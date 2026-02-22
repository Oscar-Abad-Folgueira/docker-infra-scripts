services:
  db:
    image: mysql:8.4
    container_name: __PROJECT___db
    environment:
      MYSQL_DATABASE: __PROJECT__
      MYSQL_USER: __PROJECT__
      MYSQL_PASSWORD: __PROJECT__
      MYSQL_ROOT_PASSWORD: __PROJECT___root
    ports:
      - "__DB_PORT__:3306"

  phpmyadmin:
    image: phpmyadmin:5-apache
    container_name: __PROJECT___phpmyadmin
    depends_on:
      - db
    ports:
      - "__WEB_PORT__:80"
    environment:
      PMA_HOST: db
      PMA_PORT: 3306
