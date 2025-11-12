#!/bin/bash
cd "$(dirname "$0")/.."
echo "[*] Starting PQC TLS server on port 4433..."
openssl s_server -cert certs/server.crt -key private-keys/server.key -CAfile certs/ca.crt -accept 4433 -www -tls1_3
