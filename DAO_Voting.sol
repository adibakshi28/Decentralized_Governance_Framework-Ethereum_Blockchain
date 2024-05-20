// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AdvancedDAO is Ownable {
    IERC20 public votingToken;
    uint256 public minimumQuorum;
    uint256 public debatingPeriodDuration;

    struct Proposal {
        string description;
        bool executed;
        uint256 deadline;
        uint256 forVotes;
        uint256 againstVotes;
        mapping(address => bool) voted;
    }

    Proposal[] public proposals;

    event ProposalCreated(uint256 id, string description, uint256 deadline);
    event Voted(uint256 proposalId, bool position, address voter, uint256 weight);
    event ProposalExecuted(uint256 id, bool result);

    // The Ownable constructor is called implicitly if there are no parameters needed.
    constructor(address _votingToken, uint256 _minimumQuorum, uint256 _debatingPeriodDuration) Ownable(msg.sender) {
        votingToken = IERC20(_votingToken);
        minimumQuorum = _minimumQuorum;
        debatingPeriodDuration = _debatingPeriodDuration;
    }

    function createProposal(string memory _description) public onlyOwner {
        uint256 deadline = block.timestamp + debatingPeriodDuration;
        proposals.push();
        uint256 proposalId = proposals.length - 1;
        Proposal storage newProposal = proposals[proposalId];
        newProposal.description = _description;
        newProposal.executed = false;
        newProposal.deadline = deadline;
        emit ProposalCreated(proposalId, _description, deadline);
    }

    function vote(uint256 _proposalId, bool _support) public {
        Proposal storage proposal = proposals[_proposalId];
        require(block.timestamp < proposal.deadline, "Voting is closed.");
        require(!proposal.voted[msg.sender], "Already voted.");
        require(!proposal.executed, "Proposal already executed.");

        uint256 voterBalance = votingToken.balanceOf(msg.sender);
        require(voterBalance > 0, "No voting tokens held.");

        if (_support) {
            proposal.forVotes += voterBalance;
        } else {
            proposal.againstVotes += voterBalance;
        }

        proposal.voted[msg.sender] = true;
        emit Voted(_proposalId, _support, msg.sender, voterBalance);
    }

    function executeProposal(uint256 _proposalId) public {
        Proposal storage proposal = proposals[_proposalId];
        require(block.timestamp >= proposal.deadline, "Debating period not over.");
        require(!proposal.executed, "Proposal already executed.");
        require(proposal.forVotes + proposal.againstVotes >= minimumQuorum, "Minimum quorum not met.");

        proposal.executed = true;
        bool result = proposal.forVotes > proposal.againstVotes;

        emit ProposalExecuted(_proposalId, result);
    }
    
    function emergencyStopProposal(uint256 _proposalId) public onlyOwner {
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.executed, "Proposal already executed.");
        proposal.executed = true;
        emit ProposalExecuted(_proposalId, false);
    }

    function changeMinimumQuorum(uint256 _newMinimumQuorum) public onlyOwner {
        minimumQuorum = _newMinimumQuorum;
    }

    function changeDebatingPeriodDuration(uint256 _newDebatingPeriodDuration) public onlyOwner {
        debatingPeriodDuration = _newDebatingPeriodDuration;
    }

    // Additional functions and logic can be implemented as needed
}
