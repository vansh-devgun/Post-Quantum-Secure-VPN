# 🔐 Post-Quantum Cryptography with OpenSSL 3 + OQS Integration

### 🚀 Project Overview
This project demonstrates how to **build and test OpenSSL 3.0 with the Open Quantum Safe (OQS) provider** to enable **Post-Quantum Cryptography (PQC)** algorithms.  
The goal is to generate and use **quantum-resistant keys and certificates** locally on a Linux (Kali) system.

---

## 🧠 What is Post-Quantum Cryptography (PQC)?
Post-Quantum Cryptography is designed to protect data against attacks from **quantum computers**.  
Traditional algorithms like RSA and ECC can be broken by quantum attacks, so PQC introduces new algorithms based on hard mathematical problems such as lattices and hash-based signatures.

---

## ⚙️ Project Workflow

### 1️⃣ Clone and Build Dependencies
We first installed essential build tools and libraries:
```bash
sudo apt install -y git cmake build-essential ninja-build libssl-dev python3-pip
