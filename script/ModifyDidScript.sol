// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {DidRegistry} from "../src/DidRegistry.sol";

contract ModifyDidRegistryScript is Script {
    function run() external {
        vm.startBroadcast();

        DidRegistry registry = DidRegistry(0x00);
        registry.modifyDid(1, "new metadata modify");

        vm.stopBroadcast();
    }
}
