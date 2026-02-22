services:
  app:
    image: node:22-alpine
    container_name: __PROJECT___next
    working_dir: /workspace
    command: sh -lc "npm install && npm run dev"
    environment:
      NODE_ENV: development
      NEXT_TELEMETRY_DISABLED: "1"
    volumes:
      - ./:/workspace:cached
    ports:
      - "__APP_PORT__:3000"
