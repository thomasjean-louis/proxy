#!/bin/sh


cd /quakejs

# SSL

# Create private key / Certificate Signing REquest
openssl req -new -newkey rsa:4096 -nodes \
    -keyout server.key -out server.csr \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"

# Create self signed certificate
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" \
    -keyout server.key  -out server.cert

# make-ssl-cert generate-default-snakeoil --force-overwrite
# echo '{"key":"/etc/ssl/private/ssl-cert-snakeoil.key","cert":"/etc/ssl/certs/ssl-cert-snakeoil.pem"}' >> ./bin/wssproxy.json

node bin/proxy.js




