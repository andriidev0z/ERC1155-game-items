const { network } = require("hardhat");
const {
  developmentChains,
  VERIFICATION_BLOCK_CONFIRMATIONS,
} = require("../helper-hardhat-config");
const { verify } = require("../utils/verify");
const helpers = require("@nomicfoundation/hardhat-network-helpers");

async function main() {
    const { deploy, log } = deployments;
    const { deployer } = await getNamedAccounts();
    const waitBlockConfirmations = developmentChains.includes(network.name)
    ? 1
    : VERIFICATION_BLOCK_CONFIRMATIONS;

    const arguments = []; 
    const GameItems = await deploy("GameItems", {
        from: deployer,
        args: arguments,
        log: true,
        waitConfirmations: waitBlockConfirmations,
    });
    // Verify the deployment
    if (
        !developmentChains.includes(network.name) &&
        process.env.ETHERSCAN_API_KEY
    ) {
        log("Verifying...GameItems");
        await verify(GameItems.address, arguments);
    }
}

main()