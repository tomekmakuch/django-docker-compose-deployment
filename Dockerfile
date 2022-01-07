FROM python:3.9-alpine3.13

LABEL maintainer="tomekmakuch"

ENV PYTHONUBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./app /app

WORKDIR /app

EXPOSE 8000

RUN python -m venv py && \
    /py/bin/pip3 install --upgrade pip && \
    /py/bin/pip3 install -r requirements.txt && \
    adduser --disabled-password --no-create=home app

ENV PATH="/py/bin:$PATH"

USER app