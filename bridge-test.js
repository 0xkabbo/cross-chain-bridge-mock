const hre = require("hardhat");

async function main() {
  const [deployer, user] = await hre.ethers.getSigners();

  // Mock deployment of bridge infrastructure
  const Token = await hre.ethers.getContractFactory("DestinationToken");
  const token = await Token.deploy();
  await token.waitForDeployment();

  const Bridge = await hre.ethers.getContractFactory("DestinationBridge");
  const bridge = await Bridge.deploy(await token.getAddress());
  await bridge.waitForDeployment();

  // Transfer ownership of token to bridge so bridge can mint/burn
  await token.transferOwnership(await bridge.getAddress());

  console.log("Bridge Destination Logic Deployed.");
  console.log("Wrapped Token:", await token.getAddress());
  console.log("Bridge Controller:", await bridge.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
