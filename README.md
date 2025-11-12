🧬 Post-Quantum Secure VPN
🚀 Overview

Post-Quantum Secure VPN is a research and implementation project exploring Post-Quantum Cryptography (PQC) integration into TLS 1.3 using OpenSSL 3.x + OQS (Open Quantum Safe).
It demonstrates how classical cryptography can be hybridized or replaced with quantum-resistant algorithms such as ML-DSA, ensuring long-term data security against quantum attacks.

### 🔐Project Goals

- Implement a TLS 1.3 handshake secured by post-quantum key exchange and signatures.

- Use OpenSSL 3 + liboqs to generate PQC certificates.

- Build a simple TLS client-server for local testing.

- Lay the foundation for a future PQC-secured VPN.

## 🧩 Repository Structure
```
Post-Quantum-Secure-VPN/
│
├── certs/                   # Contains CA, server, and client certificates
├── private-keys/             # Stores generated private keys (ML-DSA, hybrid, etc.)
│
├── scripts/                  # Automation scripts for key/cert generation
│   ├── 1_generate_ca.sh
│   ├── 2_generate_server.sh
│   ├── 3_generate_client.sh
│   └── verify_cert.sh
│
├── tls-server/               # PQC TLS server
│   └── run_server.sh
│
├── tls-client/               # PQC TLS client
│   └── run_client.sh
│
├── .gitignore
├── LICENSE
└── README.md
```
⚙️ Requirements

Before starting, ensure the following are installed:
        OpenSSL (with OQS support) → oqsprovider
        bash, git

Linux environment (Ubuntu / Kali recommended)

🏗️ Setup & Usage

1️⃣ Clone the Repository
```bash
git clone https://github.com/vansh-devgun/Post-Quantum-Secure-VPN.git
cd Post-Quantum-Secure-VPN
```
2️⃣ Generate PQC Certificates

Run the scripts in order:
```bash
 scripts/1_generate_ca.sh
 scripts/2_generate_server.sh
 scripts/3_generate_client.sh
```

Verify certificate details:
```bash
scripts/verify_cert.sh
```

You should see a PQC signature algorithm (e.g., ML-DSA-44) in the output.

3️⃣ Start the PQC TLS Server
```bash
 tls-server/run_server.sh
```
4️⃣ Connect the PQC TLS Client

In a new terminal:
```bash
 tls-client/run_client.sh
```

If configured correctly, you’ll see:

    #Starting PQC TLS server on port 4433...
    #Connecting to PQC TLS server on localhost:4433...

SSL handshake has read XXX bytes and written XXX bytes
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server certificate
    Signature Algorithm: ML-DSA-44
    Subject: CN=PostQuantumServer
Verification: OK

📜Example Output

```
$ openssl x509 -in certs/server.crt -text -noout | head -15
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            5f:e1:5c:e0:6e:0b:66:d1:dc:9d:e1:50:25:aa:63:b5:72:8a:d8:e6
        Signature Algorithm: ML-DSA-44
        Issuer: CN=PostQuantumCA
        Validity
            Not Before: Nov 12 11:59:10 2025 GMT
            Not After : Nov 12 11:59:10 2026 GMT
        Subject: CN=PostQuantumServer
        Subject Public Key Info:
            Public Key Algorithm: ML-DSA-44
```

🧠 What’s Next

    Integrate Hybrid TLS (PQC + Classical)

    Add VPN encapsulation layer (e.g., WireGuard-like tunnel)

    Implement Post-Quantum Key Exchange (e.g., Kyber)

     Performance benchmarking for PQC handshakes

    Dockerize the setup for reproducible testing

🧾 License

    This project is licensed under the MIT License
    .


👤 Author
    Vansh Devgun
    🔗 GitHub: vansh-devgun

💡 “Building for the quantum era — one secure connection at a time.”
