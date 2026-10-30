// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Escrow2 {
    event Approved(uint);

    address public depositor;
    address public beneficiary;
    address public arbiter;
    bool public isApproved;

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        require(!isApproved);
        require(msg.sender == arbiter);

        uint amount = address(this).balance;

        (bool s, ) = beneficiary.call{value: amount}("");
        require(s);

        isApproved = true;

        emit Approved(amount);
    }
}
