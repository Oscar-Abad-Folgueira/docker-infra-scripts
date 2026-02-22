services:
  web:
    image: php:8.3-apache
    container_name: __PROJECT___apachephp
    ports:
      - "__WEB_PORT__:80"
    volumes:
      - ./:/var/www/html:cached
