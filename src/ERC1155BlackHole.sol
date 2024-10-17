// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";

contract ERC1155BlackHole is ERC1155Holder {
    // Event emitted when tokens are received
    event TokensReceived(
        address indexed operator,
        address indexed from,
        uint256[] ids,
        uint256[] values,
        bytes data
    );

    // Function to handle batch receipt of ERC1155 tokens
    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    ) public virtual override returns (bytes4) {
        emit TokensReceived(operator, from, ids, values, data);
        return super.onERC1155BatchReceived(operator, from, ids, values, data);
    }

    // Function to handle single ERC1155 token receipt
    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes memory data
    ) public virtual override returns (bytes4) {
        uint256[] memory ids = new uint256[](1);
        uint256[] memory values = new uint256[](1);
        ids[0] = id;
        values[0] = value;
        emit TokensReceived(operator, from, ids, values, data);
        return super.onERC1155Received(operator, from, id, value, data);
    }
}
