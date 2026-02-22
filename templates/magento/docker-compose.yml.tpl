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

  opensearch:
    image: opensearchproject/opensearch:2
    container_name: __PROJECT___opensearch
    environment:
      discovery.type: single-node
      plugins.security.disabled: "true"
      OPENSEARCH_JAVA_OPTS: "-Xms512m -Xmx512m"

  redis:
    image: redis:7-alpine
    container_name: __PROJECT___redis

  magento:
    image: markshust/magento-php:8.2-fpm
    container_name: __PROJECT___magento
    depends_on:
      - db
      - opensearch
      - redis
    working_dir: /var/www/html
    volumes:
      - ./:/var/www/html:cached

  web:
    image: nginx:1.27-alpine
    container_name: __PROJECT___web
    depends_on:
      - magento
    ports:
      - "__WEB_PORT__:80"
    volumes:
      - ./:/var/www/html:cached

volumes:
  __PROJECT___db:
