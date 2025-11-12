#!/bin/bash
set -e
mkdir -p certs private-keys
echo "[*] Generating server key and CSR..."
openssl genpkey -algorithm ml-dsa-44 -out private-keys/server.key
openssl req -new -key private-keys/server.key -out certs/server.csr -subj "/CN=PostQuantumServer"
echo "[*] Signing server CSR with CA..."
openssl x509 -req -in certs/server.csr -CA certs/ca.crt -CAkey private-keys/ca.key -CAcreateserial -out certs/server.crt -days 365 -sha512
echo "[+] Server cert created: certs/server.crt"
