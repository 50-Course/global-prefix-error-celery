FROM python:3.11-slim-bullseye

WORKDIR /app

COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["celery", "-A", "main:app", "worker", "--loglevel=info"]
