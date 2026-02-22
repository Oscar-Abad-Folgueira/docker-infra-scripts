services:
  db:
    image: mysql:8.4
    container_name: __PROJECT___db
    command: --default-authentication-plugin=mysql_native_password
    environment:
      MYSQL_DATABASE: __PROJECT__
      MYSQL_USER: __PROJECT__
      MYSQL_PASSWORD: __PROJECT__
      MYSQL_ROOT_PASSWORD: __PROJECT___root
    ports:
      - "__DB_PORT__:3306"
    volumes:
      - __PROJECT___mysql:/var/lib/mysql

  wordpress:
    image: wordpress:6.8-php8.3-apache
    container_name: __PROJECT___wp
    depends_on:
      - db
    ports:
      - "__WEB_PORT__:80"
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_NAME: __PROJECT__
      WORDPRESS_DB_USER: __PROJECT__
      WORDPRESS_DB_PASSWORD: __PROJECT__
    volumes:
      - __PROJECT___wp:/var/www/html

  phpmyadmin:
    image: phpmyadmin:5-apache
    container_name: __PROJECT___pma
    depends_on:
      - db
    ports:
      - "__ADMINER_PORT__:80"
    environment:
      PMA_HOST: db
      PMA_PORT: 3306

volumes:
  __PROJECT___mysql:
  __PROJECT___wp:
