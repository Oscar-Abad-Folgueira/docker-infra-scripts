services:
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

  drupal:
    image: drupal:11-apache
    container_name: __PROJECT___drupal
    depends_on:
      - db
    ports:
      - "__WEB_PORT__:80"
    volumes:
      - __PROJECT___drupal:/var/www/html

volumes:
  __PROJECT___db:
  __PROJECT___drupal:
