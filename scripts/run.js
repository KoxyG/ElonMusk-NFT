const hre = require("hardhat");

async function main() {
  const ElonNFT = await ethers.getContractFactory("ElonNft");
  console.log("Deploying contract...");
  const elon = await ElonNFT.deploy();
  const txHash = elon.deployTransaction.hash;
  const txReceipt = await ethers.provider.waitForTransaction(txHash);

  console.log("Contract deployed to:", txReceipt.contractAddress);
  console.log("Minting NFt..");

  let txn = await elon.mintNFT();
  const minted = await txn.wait();
  console.log("NFT minted at:", minted.events[0].args.tokenId.toNumber());
}


// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
  console.error(error);
  process.exit(1);
});
