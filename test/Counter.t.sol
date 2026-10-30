// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {Escrow2} from "../src/Escrow2.sol";

contract Escrow2Test is Test {
    Escrow2 public escrow2;

    function setUp() public {
        escrow2 = new Escrow2(address(0x1), address(0x2));
    }

    function testApprove() public {
        address arbiter = address(0x1);
        address beneficiary = address(0x2);
        address depositor = address(0x3);

        // Deploy the Escrow contract with the specified addresses
        Escrow2 escrow = new Escrow2{value: 1 ether}(arbiter, beneficiary);

        // Simulate the arbiter approving the escrow
        vm.prank(arbiter);
        escrow.approve();

        // Check that the escrow is approved
        assertTrue(escrow.isApproved());
    }
}
