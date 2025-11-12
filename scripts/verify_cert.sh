#!/bin/bash
set -e
echo "[*] Verifying server cert..."
openssl verify -CAfile certs/ca.crt certs/server.crt
echo "[*] Verifying client cert..."
openssl verify -CAfile certs/ca.crt certs/client.crt
