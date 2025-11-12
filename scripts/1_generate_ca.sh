#!/bin/bash
set -e
mkdir -p certs private-keys
echo "[*] Generating PQC CA key and cert..."
openssl genpkey -algorithm ml-dsa-44 -out private-keys/ca.key
openssl req -x509 -new -key private-keys/ca.key -out certs/ca.crt -days 365 -subj "/CN=PostQuantumCA"
echo "[+] CA created: certs/ca.crt private-keys/ca.key"
