// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LXStudioNFT is ERC721A, Ownable {
    uint256 MAX_SUPPLY = 101714; // Initial max supply of NFTs

    // Using temporary metadata from MFERS' IPFS
    string public baseURI = "ipfs://bafybeieyetlp2c2vubffzjjap7utuz5jwo2k5b5kupvezfchc5tnfg4fh4/";

    constructor() ERC721A("Persona Exis NFT", "PXNFT") {}

    function mint(uint256 quantity) external onlyOwner {
        _safeMint(msg.sender, quantity);
    }

    function withdraw() external payable onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function setMintRate(uint256 _mintRate) public onlyOwner {
        mintRate = _mintRate;
    }
}
