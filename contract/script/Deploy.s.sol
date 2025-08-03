// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {InsuranceManager} from "../src/InsuranceManager.sol";
import {MockUSDC} from "../src/MockUSDC.sol";

contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy MockUSDC first
        MockUSDC usdc = new MockUSDC();
        console.log("MockUSDC deployed at:", address(usdc));

        // Deploy InsuranceManager
        InsuranceManager insuranceManager = new InsuranceManager(address(usdc));
        console.log("InsuranceManager deployed at:", address(insuranceManager));

        vm.stopBroadcast();
    }
} 