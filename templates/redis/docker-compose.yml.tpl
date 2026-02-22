services:
  redis:
    image: redis:7-alpine
    container_name: __PROJECT___redis
    ports:
      - "__DB_PORT__:6379"
    volumes:
      - __PROJECT___redis:/data
volumes:
  __PROJECT___redis:
