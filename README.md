# 🔐 OpenSSL + liboqs Post-Quantum Cryptography Project

This project integrates **Post-Quantum Cryptography (PQC)** algorithms into **OpenSSL 3** using the **Open Quantum Safe (OQS)** library.  
The goal is to demonstrate key generation, certificate creation, and signature verification using **post-quantum algorithms** like ML-DSA.

---

## 🧩 Project Overview
- Based on OpenSSL 3 integrated with OQS.
- Uses PQC algorithms such as:
  - ML-DSA (Dilithium)
  - ML-KEM (Kyber)
- Demonstrates hybrid key exchange and signing.

---

## ⚙️ Setup Steps

### 1️⃣ Clone and Build OQS-OpenSSL
```bash
git clone https://github.com/open-quantum-safe/oqs-provider.git
cd oqs-openssl
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
