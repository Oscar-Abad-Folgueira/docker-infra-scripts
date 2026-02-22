services:
  app:
    image: python:3.12-slim
    container_name: __PROJECT___django
    working_dir: /app
    command: sh -lc "pip install -U pip && pip install -r requirements.txt && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"
    volumes:
      - ./:/app:cached
    ports:
      - "__APP_PORT__:8000"
