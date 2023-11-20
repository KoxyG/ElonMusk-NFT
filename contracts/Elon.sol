// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.19;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";



contract ElonNft is ERC721URIStorage {
     using Counters for Counters.Counter;
     Counters.Counter private _tokenIds;

     constructor() ERC721("ElonNft", "ELON") {
     }

     function mintNFT() public returns (uint256) {
          _tokenIds.increment();
          uint256 newItemId = _tokenIds.current();
          _mint(msg.sender, newItemId);
          _setTokenURI(newItemId, "https://lavender-electric-gerbil-466.mypinata.cloud/ipfs/QmPzi4nB59ob7TSaVRVFgQKaZTvUMBpHX65KENcxkQRNAy");
          console.log("Minted NFT #%s", newItemId, msg.sender);
          return newItemId;
     }
}