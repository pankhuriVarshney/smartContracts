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

}