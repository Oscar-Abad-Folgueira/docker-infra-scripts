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

  prestashop:
    image: prestashop/prestashop:latest
    container_name: __PROJECT___prestashop
    depends_on:
      - db
    ports:
      - "__WEB_PORT__:80"
    environment:
      DB_SERVER: db
      DB_NAME: __PROJECT__
      DB_USER: __PROJECT__
      DB_PASSWD: __PROJECT__
      PS_INSTALL_AUTO: "1"

volumes:
  __PROJECT___db:
