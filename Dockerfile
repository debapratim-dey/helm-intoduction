FROM python:3.7

MAINTAINER Debapratim Dey

RUN mkdir -p /api

COPY /api /api
WORKDIR /api

RUN pip install requests
RUN pip install flask
RUN pip install flask_cors

EXPOSE 5000
CMD [ "python", "api.py" ]

