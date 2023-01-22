# votingDao

This smart contract is built on top of ERC721 standard, it uses the ERC721 contract's functions to check if the caller of the function is a valid voter by checking if the caller's address owns an NFT token that is in the list of validVoters. A struct is used to define the format of the data stored in the mapping for each proposal. A mapping is used to store information about each proposal, including the creator's address, the name of the proposal, and the number of votes it has received.

A modifier called "onlyValidVoters" is used to check if the caller of the function is a valid voter before allowing them to vote or propose. The constructor function is used to initialize the contract and add the contract creator's first NFT token as a valid voter. An event called "VoteCast" is emitted each time a vote is cast, and it carries the address of the voter and the proposal ID that they voted for as parameters.

This smart contract uses NFT tokens as a way to validate voters, an alternative tokenomy of this contract could be to use a token contract and transfer tokens to this contract in order to vote.
