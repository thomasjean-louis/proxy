FROM node:18-alpine as build

USER root

# RUN apk update
RUN apk --no-cache --no-check-certificate update
RUN apk --no-cache --no-check-certificate upgrade
RUN apk --no-cache --no-check-certificate add openssl
# RUN apk --no-cache --no-check-certificate add ssl-cert 

# ARG DEBIAN_FRONTEND=noninteractive
# ENV TZ=US/Eastern

# RUNapt-get update
# RUN apt-get upgrade -y
 


# RUN apk add --no-cache sudo
# RUN apk add --no-cache openssl
# RUN apk add --no-cache ssl-cert
# RUN apk add --no-cache apt-utils
# RUN apk add --no-cache jq

# RUN apt-get install  sudo -y
# RUN apt-get install  openssl -y
# RUN apt-get install  ssl-cert -y
# RUN apt-get install  apt-utils -y
# RUN apt-get install  npm -y
# RUN apt-get install  jq -y

# RUN sudo -E bash -

COPY ./quakejs /quakejs

WORKDIR /quakejs

RUN npm install


WORKDIR /
ADD entrypoint.sh /entrypoint.sh

RUN chmod 777 ./entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
