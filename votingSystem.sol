// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract _votingSystem
{
    struct Candidate {
        string name;
        address candidateAddress;
        uint voteCount;
    }

    Candidate[] public candidates;

    address admin;
    mapping(address => bool) public voters;


    constructor() 
    {
        admin=msg.sender;
    }
    
    function addCandidate(string memory candidateName, address candidateAdd) public  
    {
        require(admin==msg.sender,"NOT ADMIN. PERMISSION DENIED");
        candidates.push(Candidate({
                name: candidateName, candidateAddress: candidateAdd,
                voteCount: 0}));
    }    

    function setVote(uint candidateIndex) public {
        require(!voters[msg.sender]||admin!=msg.sender, "You have already voted. NOTE: ADMIN DOES NOT HAVE VOTING PERMISSIONS");
        require(candidateIndex < candidates.length&&candidateIndex>=0, "Invalid candidate index. Refer to candidate list");

        candidates[candidateIndex].voteCount++;
        voters[msg.sender] = true;
    }

    function getVotes() public view returns (Candidate[] memory){
        return candidates;
    }
 
}