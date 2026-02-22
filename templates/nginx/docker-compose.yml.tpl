services:
  web:
    image: nginx:1.27-alpine
    container_name: __PROJECT___nginx
    ports:
      - "__WEB_PORT__:80"
    volumes:
      - ./:/usr/share/nginx/html:ro
