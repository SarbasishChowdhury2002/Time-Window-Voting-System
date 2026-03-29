// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Time Window Voting System
/// @author 
/// @notice Allows registered members to vote within a specific time window
/// @dev Demonstrates time-based access control in Ethereum

contract TimeWindowVoting {

    /// @notice Structure to store proposal details
    struct Proposal {
        string description;
        uint startTime;
        uint endTime;
        uint yesVotes;
        uint noVotes;
        bool exists;
    }

    address public owner;
    mapping(address => bool) public members;
    mapping(uint => Proposal) public proposals;
    mapping(uint => mapping(address => bool)) public hasVoted;

    uint public proposalCount;

    /// @notice Modifier to restrict access to owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    /// @notice Modifier to allow only registered members
    modifier onlyMember() {
        require(members[msg.sender], "Not a registered member");
        _;
    }

    /// @notice Constructor sets deployer as owner
    constructor() {
        owner = msg.sender;
    }

    /// @notice Register a new member
    /// @param _member Address of member
    function registerMember(address _member) public onlyOwner {
        members[_member] = true;
    }

    /// @notice Create a new proposal
    /// @param _description Proposal text
    /// @param _startTime Voting start time (unix timestamp)
    /// @param _endTime Voting end time (unix timestamp)
    function createProposal(
        string memory _description,
        uint _startTime,
        uint _endTime
    ) public onlyOwner {

        require(_startTime < _endTime, "Invalid time window");

        proposalCount++;

        proposals[proposalCount] = Proposal({
            description: _description,
            startTime: _startTime,
            endTime: _endTime,
            yesVotes: 0,
            noVotes: 0,
            exists: true
        });
    }

    /// @notice Vote on a proposal
    /// @param _proposalId Proposal ID
    /// @param _vote True = Yes, False = No
    function vote(uint _proposalId, bool _vote) public onlyMember {

        Proposal storage p = proposals[_proposalId];

        require(p.exists, "Proposal does not exist");
        require(block.timestamp >= p.startTime, "Voting not started");
        require(block.timestamp <= p.endTime, "Voting ended");
        require(!hasVoted[_proposalId][msg.sender], "Already voted");

        if (_vote) {
            p.yesVotes++;
        } else {
            p.noVotes++;
        }

        hasVoted[_proposalId][msg.sender] = true;
    }

    /// @notice Get voting result after time ends
    /// @param _proposalId Proposal ID
    /// @return result True if passed, False if failed
    function getResult(uint _proposalId) public view returns (bool result) {

        Proposal memory p = proposals[_proposalId];

        require(p.exists, "Proposal does not exist");
        require(block.timestamp > p.endTime, "Voting still ongoing");

        return (p.yesVotes > p.noVotes);
    }
}