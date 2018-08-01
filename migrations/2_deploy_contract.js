const Web3 = require('web3');

const ParentContract = artifacts.require('ParentContract');
const Logger = artifacts.require('Logger');

module.exports = async (deployer) => {
  await deployer.deploy(Logger);
  await deployer.deploy(ParentContract, Logger.address);
  const instance = await ParentContract.deployed();

  const functionReturn = await instance.emitEvent();
  console.log(functionReturn);
};
