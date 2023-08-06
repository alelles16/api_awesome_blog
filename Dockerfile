FROM python:3.10-slim-bullseye

ENV PYTHONUNBUFFEERED 1
RUN mkdir /api_awesome_blog

WORKDIR /api_awesome_blog
COPY . .

RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN adduser user
USER user
