services:
  app:
    image: node:22-alpine
    container_name: __PROJECT___node
    working_dir: /workspace
    command: sh -lc "npm install && npm run dev"
    volumes:
      - ./:/workspace:cached
    ports:
      - "__APP_PORT__:3000"
    environment:
      NODE_ENV: development
