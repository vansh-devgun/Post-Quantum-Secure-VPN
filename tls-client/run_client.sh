#!/bin/bash
cd "$(dirname "$0")/.."
echo "[*] Connecting to PQC TLS server on localhost:4433..."
openssl s_client -connect localhost:4433 -cert certs/client.crt -key private-keys/client.key -CAfile certs/ca.crt -tls1_3
