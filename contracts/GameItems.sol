// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GameItems is ERC1155 {
    uint256 public constant GOLD = 0;
    uint256 public constant THORS_HAMMER = 1;
    uint256 public constant SWORD = 2;
    uint256 public constant SHIELD = 3;

    constructor()
        ERC1155(
            "https://ipfs.io/ipfs/QmZdL9GcrUzqCMNbwgyZpPXup85aXkseFuwokEYUjB7GtS/"
        )
    {
        _mint(msg.sender, GOLD, 5, "");
        _mint(msg.sender, THORS_HAMMER, 1, "");
        _mint(msg.sender, SWORD, 10, "");
        _mint(msg.sender, SHIELD, 5, "");
    }

    function uri(
        uint256 _tokenId
    ) public view override returns (string memory) {
        return
            string(
                abi.encodePacked(
                    super.uri(_tokenId),
                    Strings.toString(_tokenId),
                    ".json"
                )
            );
    }
}
