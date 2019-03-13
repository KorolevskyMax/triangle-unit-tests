FROM python:3.7.2-alpine3.9

ADD . /tests
WORKDIR /tests
RUN pip install -r requirements.txt
