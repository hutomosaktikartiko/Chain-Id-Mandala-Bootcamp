// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {DidRegistry} from "../src/DidRegistry.sol";

contract ModifyDidRegistryScript is Script {
    function run() external {
        vm.startBroadcast();

        DidRegistry registry = DidRegistry(
            0xe6e02e83a368D09cbBf51eE019e0646C1406053D
        );
        registry.modifyDid(0, "new metadata modify");

        vm.stopBroadcast();
    }
}
