#!/bin/bash

# Generate a private key
openssl genrsa -out localhost.key 2048

# Create a certificate signing request
openssl req -new -key localhost.key -out localhost.csr -subj "/CN=localhost"

# Create a self-signed certificate
openssl x509 -req -days 365 -in localhost.csr -signkey localhost.key -out localhost.crt

# For the client certificate
openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr -subj "/CN=John"
openssl x509 -req -days 365 -in client.csr -signkey client.key -out client.crt
