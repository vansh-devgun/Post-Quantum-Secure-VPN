#!/bin/bash
set -e
mkdir -p certs private-keys
echo "[*] Generating client key and CSR..."
openssl genpkey -algorithm ml-dsa-44 -out private-keys/client.key
openssl req -new -key private-keys/client.key -out certs/client.csr -subj "/CN=PostQuantumClient"
echo "[*] Signing client CSR with CA..."
openssl x509 -req -in certs/client.csr -CA certs/ca.crt -CAkey private-keys/ca.key -CAcreateserial -out certs/client.crt -days 365 -sha512
echo "[+] Client cert created: certs/client.crt"
