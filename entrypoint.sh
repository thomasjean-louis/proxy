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

node bin/proxy.js




