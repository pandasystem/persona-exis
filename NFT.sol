// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PersonaExis is ERC721A, Ownable {

    // Using temporary metadata from MFERS' IPFS
    string public baseURI = "ipfs://bafybeieyetlp2c2vubffzjjap7utuz5jwo2k5b5kupvezfchc5tnfg4fh4/";

    constructor() ERC721A("Persona Exis NFT", "PXNFT") {}

    function mint() external onlyOwner {
        // @dev This will mint 1 NFT at a time
        _safeMint(msg.sender, 1);
    }


    // Placeholder withdraw function
    function withdraw() external payable onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }
    
     function updateBaseURI(string memory _newURIAddress) external onlyOwner {
        baseURI = _newURIAddress;
    }

}
