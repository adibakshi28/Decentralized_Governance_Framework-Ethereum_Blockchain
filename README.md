# Decentralized Governance Framework Protocol on Ethereum Blockchain
Implemented a DAO framework on Ethereum with smart contracts for autonomous governance, and developed "AdityaToken" (ADI) as an ERC20 token for decentralized voting within the DAO..

## Overview

The `AdvancedDAO` smart contract enables decentralized governance by allowing token holders to create proposals, vote on them, and execute the decisions. It is built using Solidity and utilizes OpenZeppelin libraries for secure and efficient contract development.

## Features

- **Proposal Creation**: Only the owner can create new proposals.
- **Voting**: Token holders can vote for or against proposals.
- **Quorum**: Proposals require a minimum quorum of votes to be considered valid.
- **Debating Period**: Proposals have a set debating period during which votes can be cast.
- **Execution**: Proposals can be executed after the debating period if the quorum is met.
- **Emergency Stop**: The owner can stop any proposal in case of an emergency.
- **Adjustable Parameters**: The owner can change the minimum quorum and debating period duration.

## Contract Details

### State Variables

- `IERC20 public votingToken`: The ERC20 token used for voting.
- `uint256 public minimumQuorum`: Minimum number of votes required for a proposal to be valid.
- `uint256 public debatingPeriodDuration`: Duration for which the proposal is open for voting.

### Structures

- `struct Proposal`: Represents a proposal with the following properties:
  - `string description`: Description of the proposal.
  - `bool executed`: Status indicating if the proposal has been executed.
  - `uint256 deadline`: Timestamp until which the proposal is open for voting.
  - `uint256 forVotes`: Number of votes in favor of the proposal.
  - `uint256 againstVotes`: Number of votes against the proposal.
  - `mapping(address => bool) voted`: Mapping to track if an address has voted.

### Events

- `ProposalCreated(uint256 id, string description, uint256 deadline)`: Emitted when a new proposal is created.
- `Voted(uint256 proposalId, bool position, address voter, uint256 weight)`: Emitted when a vote is cast.
- `ProposalExecuted(uint256 id, bool result)`: Emitted when a proposal is executed.

### Functions

- `constructor(address _votingToken, uint256 _minimumQuorum, uint256 _debatingPeriodDuration)`: Initializes the contract with the voting token, minimum quorum, and debating period duration.
- `createProposal(string memory _description) public onlyOwner`: Creates a new proposal.
- `vote(uint256 _proposalId, bool _support) public`: Casts a vote on a proposal.
- `executeProposal(uint256 _proposalId) public`: Executes a proposal if it meets the quorum after the debating period.
- `emergencyStopProposal(uint256 _proposalId) public onlyOwner`: Stops a proposal in case of an emergency.
- `changeMinimumQuorum(uint256 _newMinimumQuorum) public onlyOwner`: Changes the minimum quorum required.
- `changeDebatingPeriodDuration(uint256 _newDebatingPeriodDuration) public onlyOwner`: Changes the debating period duration.

## Getting Started

### Prerequisites

- Node.js and npm
- Hardhat for Ethereum development
- OpenZeppelin Contracts
