// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract studentCertificationSystem {

    struct Student {
        string name;
        address studentAddress;
        uint certCount;
    }

    struct Certificate {
        string certName;
        bool verified;
    }

    mapping(address => Student) public students;
    mapping(address => Certificate[]) public certificates;
    address public admin;
    uint count=0;
    
    function addCertificate(address studentAddress, string memory studentName, string memory certificateName) public {
    }

    function verifyCertificate(address studentAddress, uint certIndex) public {
    }

    function displayAll(address studentAddress) public view returns(Certificate[] memory){
    }
