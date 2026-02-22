services:
  app:
    image: node:22-alpine
    container_name: __PROJECT___vuevite
    working_dir: /workspace
    command: sh -lc "npm install && npm run dev -- --host 0.0.0.0 --port 5173"
    volumes:
      - ./:/workspace:cached
    ports:
      - "__APP_PORT__:5173"
