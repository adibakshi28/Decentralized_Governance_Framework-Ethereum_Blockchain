# Decentralized Governance Framework Protocol on Ethereum Blockchain

## Overview

This project implements an Advanced Decentralized Autonomous Organization (DAO) using the Ethereum blockchain. The DAO leverages smart contracts to facilitate decentralized governance, allowing token holders to propose, vote on, and execute collective decisions. The ERC20 token "AdityaToken" (ADI) is used for voting power, enabling a democratic process secured by blockchain technology.

## Report

For a detailed explanation of the project, please refer to the [Project Report](Report.pdf).

## Table of Contents

1. [Introduction](#introduction)
2. [Objective](#objective)
3. [Development Environment & Tools](#development-environment--tools)
4. [Smart Contract Design](#smart-contract-design)
5. [Deployment & Testing](#deployment--testing)
6. [Challenges & Solutions](#challenges--solutions)
7. [Future Improvements](#future-improvements)
8. [How to Run](#how-to-run)

## Introduction

A Decentralized Autonomous Organization (DAO) represents a new paradigm in collective decision-making and resource management. By harnessing the power of smart contracts on the Ethereum blockchain, DAOs offer a transparent, immutable, and secure environment for group governance without centralized control.

## Objective

The objective of this project is to create a DAO that allows members to participate in governance through a secure and automated process. The project demonstrates the viability of blockchain technology in facilitating democratic decision-making processes.

## Development Environment & Tools

- **Solidity (v0.8.0)**
- **Remix IDE**
- **MetaMask (Sepolia Test Network)**
- **Etherscan (Sepolia Testnet Explorer)**
- **OpenZeppelin Contracts**

## Smart Contract Design

### Features

1. **Proposal System**: Allows token holders to propose new ideas.
2. **Voting Based on Tokens**: Voting power is proportional to the number of tokens held.
3. **Debating Period**: Time-bound discussion period before voting ends.
4. **Quorum**: Minimum number of votes required for a decision to be valid.
5. **Automatic Execution**: Proposals are executed automatically if they meet the quorum and majority requirements.
6. **Security Measures**: Specific security rules to ensure smooth operation and prevent unauthorized changes.

## Deployment & Testing

The DAO contracts were deployed and tested on the Sepolia Test Network. The testing involved creating proposals, voting on proposals, and executing proposals after the debating period, ensuring accurate voting power based on ADI tokens.

### Etherscan Links
- [ADI Token](https://sepolia.etherscan.io/address/0xa346d0fe51d32f9fbef02191782902d89f5ffc8b)
- [DAO Contract](https://sepolia.etherscan.io/address/0x3a9ca4bd201cac96c21d81942e360036a14bb83c)

## Challenges & Solutions

### Challenges
1. Preventing the reuse of voting power across different proposals.
2. Ensuring token holders cannot vote more than once on the same proposal.

### Solutions
- Implemented address mapping to track whether an address has voted on a proposal.
- Voting power is tied to the token balance at the time of voting, preventing manipulation through token transfers.

## Future Improvements

1. **Delegated Voting**: Allowing token holders to delegate their votes.
2. **Scalability**: Improving contract efficiency for handling more users and proposals.
3. **Modular Code Structure**: Making it easier to add new features or make changes.
4. **Interoperability**: Enabling the DAO to interact with other contracts.
5. **Grace Period**: Adding a waiting period after a decision is made.
6. **Security Audits**: Conducting thorough security audits.
7. **Incentives for Participation**: Providing rewards for participation.
8. **Adaptive Quorum**: Adjusting the quorum based on recent participation.
9. **Anonymous Voting**: Implementing private voting mechanisms.
10. **Layer 2 Integration**: Connecting with fast blockchain layers for better performance.

## How to Run

### Prerequisites
- MetaMask Wallet
- Sepolia Test Network
- Remix IDE

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/adibakshi28/Decentralized_Governance_Framework-Ethereum_Blockchain.git
   cd Decentralized_Governance_Framework-Ethereum_Blockchain
   ```

2. Compile Contracts:
        Open the Remix IDE.
        Load `DAO_Voting.sol` and `Minting_ERC20_Token.sol`.
        Compile both contracts.

3. Deploy Contracts:
        Deploy `Minting_ERC20_Token.sol` to the Sepolia Test Network.
        Copy the deployed token contract address.
        Deploy `DAO_Voting.sol` using the token contract address as a parameter.

4. Interact with the Contracts:
        Use MetaMask to connect to the Sepolia Test Network.
        Interact with the deployed contracts through Remix IDE or a front-end application.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.

## Contact

For any inquiries or support, feel free to contact me

[Adibakshi28 - GitHub Profile](https://github.com/adibakshi28)

Happy Decentralizing!
