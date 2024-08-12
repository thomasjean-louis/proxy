FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/Eastern

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install  sudo -y
RUN apt-get install  npm -y
RUN apt-get install  jq -y
RUN apt-get install  openssl -y
RUN apt-get install  ssl-cert -y
RUN apt-get install  apt-utils -y



RUN sudo -E bash -

COPY ./quakejs /quakejs


WORKDIR /quakejs
RUN npm install


WORKDIR /
ADD entrypoint.sh /entrypoint.sh
# Was having issues with Linux and Windows compatibility with chmod -x, but this seems to work in both
RUN chmod 777 ./entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
