// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";

contract ERC1155BlackHole is ERC1155Holder {
    // This contract is immutable, so it doesn't need a constructor or any state variables

    // Prevent non-ERC1155 tokens to be sent to the contract
    receive() external payable {
        revert("This contract only accepts ERC-1155 tokens");
    }
}
