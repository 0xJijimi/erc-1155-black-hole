// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {ERC1155BlackHole} from "../src/ERC1155BlackHole.sol";

contract ERC1155BlackHoleScript is Script {
    // Deploys and verifies the contract
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        string memory rpcUrl = vm.envString("RPC_URL");

        console.log("Deployer address:", deployerAddress);

        vm.createSelectFork(rpcUrl);
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the contract
        ERC1155BlackHole blackHole = new ERC1155BlackHole();
        console.log("ERC1155BlackHole deployed at:", address(blackHole));

        vm.stopBroadcast();

        // Verify the contract
        if (block.chainid == 250) {
            // Fantom Opera Mainnet
            console.log("Attempting to verify contract on FTMScan...");
            string[] memory args = new string[](7);
            args[0] = "forge";
            args[1] = "create";
            args[2] = "--rpc-url";
            args[3] = rpcUrl;
            args[4] = "--private-key";
            args[5] = vm.toString(deployerPrivateKey);
            args[6] = "src/ERC1155BlackHole.sol:ERC1155BlackHole";

            try vm.ffi(args) returns (bytes memory result) {
                console.log(string(result));
                console.log("Contract verified successfully!");
            } catch {
                console.log(
                    "Contract verification failed. Please verify manually."
                );
            }
        } else {
            console.log("Not on Fantom Opera Mainnet. Skipping verification.");
        }

        console.log("Deployment and verification script completed.");
    }
}
