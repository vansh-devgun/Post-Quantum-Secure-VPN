# 🔐 Post-Quantum Cryptography with OpenSSL + liboqs

This project demonstrates the integration of **Post-Quantum Cryptography (PQC)** algorithms into **OpenSSL 3** using the **Open Quantum Safe (OQS)** provider.  
It showcases **key generation**, **certificate creation**, and **verification** using quantum-resistant algorithms such as **ML-DSA** (Dilithium) and **ML-KEM** (Kyber).

---

## 🧩 Project Overview

- Built on **OpenSSL 3.0** integrated with the **liboqs** library.  
- Implements **Post-Quantum Signature (ML-DSA)** and **Key Encapsulation (ML-KEM)** algorithms.  
- Demonstrates:
  - ✅ PQC Certificate Authority (CA)
  - ✅ PQC Server and Client Certificates
  - ✅ Post-Quantum Signature Verification

---

## 🧠 What Is Post-Quantum Cryptography?

Post-Quantum Cryptography (PQC) refers to cryptographic algorithms designed to be secure against attacks by **quantum computers**.  
Traditional RSA and ECC systems are vulnerable to quantum attacks (via **Shor’s Algorithm**).  
PQC algorithms, like **ML-DSA** and **ML-KEM**, rely on **lattice-based** and **hash-based** cryptographic constructions, providing long-term security.

---

## ⚙️ Setup Instructions

### 1️⃣ Prerequisites

Ensure you have the following packages installed:
```bash
sudo apt update
sudo apt install git cmake build-essential ninja-build libssl-dev python3-pip -y
```
2️⃣ Clone and Build the OQS Provider
git clone https://github.com/open-quantum-safe/oqs-provider.git
cd oqs-provider
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install


✅ This builds and installs the OQS provider, extending OpenSSL with PQC algorithm support.

🧩 Project Workflow

The workflow involves creating:

A Post-Quantum Certificate Authority (CA)

A Server certificate

A Client certificate

Validation using PQC-enabled OpenSSL commands

📈 Workflow Diagram

(Replace this with your actual diagram once uploaded)

🔹 Step 1: Create a PQC Certificate Authority (CA)
openssl genpkey -algorithm ml-dsa-44 -out ml-dsa-44.key
openssl req -x509 -new -key ml-dsa-44.key -out ml-dsa-44.crt -subj "/CN=PQC Test Cert"


Output Files:

ml-dsa-44.key → CA private key

ml-dsa-44.crt → CA self-signed certificate

🔹 Step 2: Create a PQC Server Certificate
openssl genpkey -algorithm ml-dsa-44 -out server.key
openssl req -new -key server.key -out server.csr -subj "/CN=PostQuantumServer"
openssl x509 -req -in server.csr -CA ml-dsa-44.crt -CAkey ml-dsa-44.key \
  -CAcreateserial -out server.crt -days 365 -sha512


Output Files:

server.key → Server private key

server.csr → Certificate Signing Request

server.crt → Signed server certificate

🔹 Step 3: Create a PQC Client Certificate
openssl genpkey -algorithm ml-dsa-44 -out client.key
openssl req -new -key client.key -out client.csr -subj "/CN=PostQuantumClient"
openssl x509 -req -in client.csr -CA ml-dsa-44.crt -CAkey ml-dsa-44.key \
  -CAcreateserial -out client.crt -days 365 -sha512


Output Files:

client.key → Client private key

client.csr → Client certificate request

client.crt → Signed client certificate

🔹 Step 4: Verify Certificate Validity
openssl verify -CAfile ml-dsa-44.crt client.crt


Expected Output:

client.crt: OK


This confirms that the client certificate is correctly signed by the PQC CA.

📂 Directory Structure
openssl-pqc-project/
├── ml-dsa-44.crt        # CA certificate
├── ml-dsa-44.key        # CA private key
├── server.crt           # Server certificate
├── server.key           # Server private key
├── client.crt           # Client certificate
├── client.key           # Client private key
└── README.md            # Documentation

📜 Technical Notes
💡 About ML-DSA (a.k.a. Dilithium)

ML-DSA (Module Lattice Digital Signature Algorithm) is a lattice-based PQC algorithm.

It’s one of the NIST-standardized post-quantum signature schemes.

Offers resistance against quantum attacks while maintaining efficient performance.

💡 Why SHA-512?

Provides strong hashing suitable for hybrid and PQC environments.

Ensures signature integrity under both classical and quantum threat models.

🧾 Verification Summary
Component	Key Algorithm	Signed By	Validity	Verified
CA	ML-DSA-44	Self-signed	365 days	✅
Server	ML-DSA-44	PQC CA	365 days	✅
Client	ML-DSA-44	PQC CA	365 days	✅
🌐 Next Step: PQC-Enabled TLS Communication

In the next phase, we will:

Launch a PQC OpenSSL server using the server.crt and server.key

Connect with a PQC client using the client.crt and client.key

Capture and analyze the TLS handshake to verify PQC cipher suites

🧰 References

Open Quantum Safe (liboqs)

OQS-OpenSSL Provider

NIST PQC Standardization Project

👨‍💻 Author

Vansh Devgun
Cybersecurity Enthusiast | Exploring Post-Quantum Cryptography
🔗 GitHub Profile
