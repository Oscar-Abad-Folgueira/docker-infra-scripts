services:
  app:
    image: python:3.12-slim
    container_name: __PROJECT___fastapi
    working_dir: /app
    command: sh -lc "pip install -U pip && pip install -r requirements.txt && uvicorn main:app --host 0.0.0.0 --port 8000 --reload"
    volumes:
      - ./:/app:cached
    ports:
      - "__APP_PORT__:8000"
