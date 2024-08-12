#!/bin/sh

cd /var/www/html


cd /quakejs

# SSL
make-ssl-cert generate-default-snakeoil --force-overwrite
echo '{"key":"/etc/ssl/private/ssl-cert-snakeoil.key","cert":"/etc/ssl/certs/ssl-cert-snakeoil.pem"}' >> ./bin/wssproxy.json

node bin/proxy.js




