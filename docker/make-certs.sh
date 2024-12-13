#!/bin/bash

# make self signed httpS cert for Tomcat
cd tomcat/conf
openssl genpkey -algorithm RSA -out localhost-rsa-key.pem
openssl req -new -key localhost-rsa-key.pem -out localhost-rsa-csr.pem
openssl x509 -req -days 365 -in localhost-rsa-csr.pem -signkey localhost-rsa-key.pem -out localhost-rsa-cert.pem