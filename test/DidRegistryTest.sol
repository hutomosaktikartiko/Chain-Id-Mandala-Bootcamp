// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {DidRegistry} from "../src/DidRegistry.sol";

contract DidRegistryTest is Test {
    DidRegistry public didRegistry;
    address public user1 = address(1);

    function setUp() public {
        didRegistry = new DidRegistry();
    }

    function testCreateDid() public {
        vm.prank(user1);
        uint256 tokenId = didRegistry.createDid(
            DidRegistry.DidType.Claimer,
            "test metadata"
        );

        DidRegistry.DID memory _did = didRegistry.getDid(tokenId);
        assertEq(_did.owner, user1);
        assertEq(_did.metadata, "test metadata");
        assertEq(uint256(_did.didType), uint256(DidRegistry.DidType.Claimer));
    }

    function testModifyDid() public {
        vm.prank(user1);
        uint256 tokenId = didRegistry.createDid(
            DidRegistry.DidType.Claimer,
            "test metadata"
        );

        didRegistry.modifyDid(tokenId, "new metadata");

        DidRegistry.DID memory _did = didRegistry.getDid(tokenId);
        assertEq(_did.metadata, "new metadata");
    }

    function testRevertMetadataNotModity() public {
        vm.prank(user1);
        uint256 tokenId = didRegistry.createDid(
            DidRegistry.DidType.Claimer,
            "test metadata"
        );

        vm.expectRevert(DidRegistry.MetadataNotChanged.selector);
        didRegistry.modifyDid(tokenId, "test metadata");
    }

    function testRevertNotOwner() public {
        vm.prank(address(2));
        uint256 tokenId = didRegistry.createDid(
            DidRegistry.DidType.Claimer,
            "test metadata"
        );

        vm.expectRevert(DidRegistry.NotOwner.selector);
        didRegistry.modifyDid(tokenId, "new metadata");
    }
}
