# 🗳️ Time-Window Voting System (Ethereum Smart Contract)

## 📌 Project Overview

This project implements a **Time-Window Voting System** using the Ethereum blockchain. It allows registered members to vote on proposals **only within a predefined time window**. Any votes cast outside the allowed time range are automatically rejected by the smart contract.

---

## 🎯 Objective

* To design and implement a secure voting mechanism using smart contracts.
* To enforce **time-based access control** for voting.
* To ensure only **authorized members** can participate.
* To demonstrate decentralized application development using Ethereum.

---

## 🛠️ Technologies Used

* **Blockchain Platform:** Ethereum
* **Smart Contract Language:** Solidity
* **IDE:** Remix IDE
* **Version Control:** GitHub

---

## ⚙️ Features

* ✅ Owner can register members
* ✅ Create proposals with start and end time
* ✅ Voting restricted within time window
* ✅ Prevents double voting
* ✅ Maintains vote counts (Yes / No)
* ✅ Returns final result after voting ends

---

## 🧠 Smart Contract Logic

### Proposal Structure

Each proposal contains:

* Description
* Start Time
* End Time
* Yes Votes
* No Votes

### Voting Conditions

A vote is accepted only if:

```
startTime ≤ block.timestamp ≤ endTime
```

### Access Control

* Only **owner** can:

  * Register members
  * Create proposals
* Only **registered members** can vote

---

## 🚀 How to Run the Project

### 1️⃣ Open Remix IDE

Go to: https://remix.ethereum.org

### 2️⃣ Create Contract File

Create a file named:

```
TimeWindowVoting.sol
```

### 3️⃣ Compile

* Select Solidity version `0.8.x`
* Click **Compile**

### 4️⃣ Deploy

* Go to **Deploy & Run Transactions**
* Select environment: `Remix VM (London)`
* Click **Deploy**

### 5️⃣ Register Members

Call:

```
registerMember(address)
```

### 6️⃣ Create Proposal

```
createProposal(description, startTime, endTime)
```

### 7️⃣ Vote

```
vote(proposalId, true/false)
```

### 8️⃣ Get Result

```
getResult(proposalId)
```

---

## 🧪 Example Workflow

1. Register 3 members
2. Create proposal with valid time window
3. Attempt voting before start time ❌ (Fails)
4. Vote during active window ✅
5. Attempt voting after end time ❌ (Fails)
6. Retrieve final result

---

## 📸 Screenshots (Add in your repo)

Include:

* Contract deployment
* Member registration
* Proposal creation
* Voting transactions
* Failed transactions (before/after time)
* Final result

---

## 📂 Project Structure

```
Time-Window-Voting/
│── TimeWindowVoting.sol
│── README.md
│── report.pdf
```

---

## 📊 Result

The smart contract successfully enforces:

* Time-restricted voting
* Secure member-based participation
* Accurate vote counting

The proposal result is determined based on majority votes.

---

## 🔒 Security Considerations

* Prevents unauthorized access
* Prevents double voting
* Enforces strict time validation using `block.timestamp`

---

## 📘 Learning Outcomes

* Understanding of Ethereum smart contracts
* Practical use of Solidity
* Implementation of access control
* Time-based logic in blockchain

---

## 👨‍💻 Author

**Sarbasish Chowdhury**
**Rohit Kumar Sah**
**Md Timsal Alam**
MTech CSE-IS, NITK Surathkal

---
