
# Nothing changes here, using the same base image as the original error environment
FROM python:3.11-slim-bullseye

WORKDIR /app

# Install git - to fix the git not found error during build
RUN apt-get update && apt-get install -y git

RUN git clone --depth 1 https://github.com/celery/kombu.git && \
    cd kombu && \
    git fetch origin pull/1838/head:pr1838 && \
    git checkout pr1838 

COPY . /app

# Install dependencies

RUN pip install --no-cache-dir -e /app/kombu
RUN pip install --no-cache-dir -r requirements.txt

CMD ["celery", "-A", "main:app", "worker", "--loglevel=info"]
