const DaiToken = artifacts.require('DaiToken')
const DappToken = artifacts.require('DappToken')
const TokenFarm = artifacts.require('TokenFarm')

module.exports = async function(deployer, network, accounts) {

  //DaiToken Deploy
  await deployer.deploy(DaiToken)
  const daiToken = await DaiToken.deployed()

  //DappToken Deploy
  await deployer.deploy(DappToken)
  const dappToken = await DappToken.deployed()

  // Deploy Tokenfarm
  await deployer.deploy(TokenFarm, daiToken.address, dappToken.address)
  const tokenFarm = await TokenFarm.deployed()

  // Deploy all DAPP tokens to the TokenFarm
  await dappToken.transfer(tokenFarm.address,'1000000000000000000000000')

  //Transfer 100 Mock DAI Tokens to Token Farm
  await daiToken.transfer(accounts[1],'100000000000000000000')
}
