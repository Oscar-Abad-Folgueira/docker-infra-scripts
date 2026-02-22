services:
  app:
    image: node:22-alpine
    container_name: __PROJECT___nestjs
    working_dir: /workspace
    command: sh -lc "npm install && npm run start:dev"
    environment:
      NODE_ENV: development
    volumes:
      - ./:/workspace:cached
    ports:
      - "__APP_PORT__:3000"
