// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {DidRegistry} from "../src/DidRegistry.sol";

contract CreateDidRegistryScript is Script {
    function run() external {
        vm.startBroadcast();

        DidRegistry registry = DidRegistry(0x00);
        registry.createDid(DidRegistry.DidType.Verifier, "test metadata");

        vm.stopBroadcast();
    }
}
