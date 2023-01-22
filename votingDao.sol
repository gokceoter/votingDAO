pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract VotingDAO is ERC721 {
    // Mapping to store voting information for each proposal
    mapping (uint => Proposal) public proposals;
    // Array to store the NFT token IDs of valid voters
    uint[] public validVoters;

    // Struct to store information about a proposal
    struct Proposal {
        address creator;
        string name;
        uint voteCount;
    }

    // Event to notify when a vote has been cast
    event VoteCast(address voter, uint proposalId);

    // Modifier to check if the caller is a valid voter
    modifier onlyValidVoters {
        require(validVoters.indexOf(ERC721.tokenOfOwnerByIndex(msg.sender, 0)) != -1, "Sender is not a valid voter.");
        _;
    }

    // Constructor function to initialize the contract
    constructor() public ERC721("VotingDAO", "VDAO") {
        // Add the contract creator's first NFT token as a valid voter
        validVoters.push(tokenOfOwnerByIndex(msg.sender, 0));
    }

    // Function to add a new proposal
    function addProposal(string memory name) public onlyValidVoters {
        require(ownerOf(validVoters[0]) == msg.sender, "Sender is not a valid voter.");
        proposals[proposals.length].creator = msg.sender;
        proposals[proposals.length].name = name;
    }

    // Function to cast a vote for a proposal
    function vote(uint proposalId) public onlyValidVoters {
        proposals[proposalId].voteCount++;
        emit VoteCast(msg.sender, proposalId);
    }
}
