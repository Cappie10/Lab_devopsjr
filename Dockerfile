FROM python:3.10-alpine

LABEL maintainer="cappie <cappie@gmail.com>"

RUN apk update \
    && pip install -U pip \
    && pip install pipenv \
    && mkdir -p /app

WORKDIR /app/

# COPY ./src/requirements.txt /app
COPY ./Pipfile* /app/

RUN set -ex \
    && apk add --no-cache --virtual .build-deps build-base \
    && pipenv install --system \
    #&& pip install gunicorn \
    && apk del .build-deps

COPY ./src /app

CMD ["flask", "run", "--host=0.0.0.0"]
