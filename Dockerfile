FROM node:18-alpine as build

USER root

RUN apk --no-cache --no-check-certificate update
RUN apk --no-cache --no-check-certificate upgrade
RUN apk --no-cache --no-check-certificate add openssl


COPY ./quakejs /quakejs

WORKDIR /quakejs

RUN npm install


WORKDIR /
ADD entrypoint.sh /entrypoint.sh

RUN chmod 777 ./entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
