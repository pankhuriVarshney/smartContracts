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

    constructor() {
        admin = msg.sender;
    }

    function addCertificate(address studentAddress, string memory studentName, string memory certificateName) public {
        count++;
        students[studentAddress] = Student({
            name: studentName,
            studentAddress: studentAddress,
            certCount: count});
        Certificate[] storage studentCertificates = certificates[studentAddress];
        studentCertificates.push(Certificate({
            certName: certificateName,
            verified: false
        }));
    }

    function verifyCertificate(address studentAddress, uint certIndex) public {
        require(msg.sender == admin, "NOT ADMIN, PERMISSION DENIED");
        require(certIndex < certificates[studentAddress].length, "CERTIFICATE ID DOES NOT EXIST");
        certificates[studentAddress][certIndex].verified = true;
    }

    function displayAll(address studentAddress) public view returns(Certificate[] memory){
        return certificates[studentAddress];
    }
}
