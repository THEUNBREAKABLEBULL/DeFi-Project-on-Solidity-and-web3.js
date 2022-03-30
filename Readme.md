What is this project about ?
-> platform name is token farm 
-> the person who uses token farm they already have mock DAI
-> they put DAI into the token farm, they stake it.
-> after some sort of regular interval they will earn DAPP Tokens for doing that, they get DAPP tokens in the wallet itself as interest.

We are particularly working on TOKENFARM smart contract :
-> We have to allow Tokenfarm smart contract to take DAI deposits and then issue DAPP tokens.
Process we will follow :
-> Deploy DAI
-> Deploy DAPP
-> Deploy Tokenfarm

We have imported DAI and DAPP in the Token Farm now we just need address of these two and pass them into Token Farm.
Migrations :
Now deploy DAI and DApp in deploy contracts 
Transfer all the DAPP tokens to Token Farm
Transfer 100 Mock DAI Tokens to Token Farm
100....^18 = 1 unit in solidity becz it doesn't take decimal actually it is => 1.0..^18

Compile Project - truffle compile
Deploy to blckchain again - truffle migrate --reset 
**(reset used to replace smart contracts in blckchain because code in blockchain is immutable it doesn't change so we have to replace it -> basically create a new copy of smart contracts and put it into blockchain and it gets an updated address.)

Check the deployment of the DaiToken : mDai = await DaiToken.deployed()

Fetch the account address : accounts : await web3.eth.getAccounts()
Pass the account given in migration : accounts[1]

Now chwck the balance with mDai variable declared above : balance = await mDai.balanceOf(accounts[1])

To check balance : balance 

To get in string format : balance.toString()

To get in human readable format : formattedBalnce = web3.utils.fromWei(balance)




1) To start with project install
npm install -g truffle
npm install ganache 
npm install (to load dependencies)
create file for migration : deploy_contracts.js 
run command : truffle compile
get a new folder abis (containg all contrats in json)
run command : truffle migrate 
will run the smart contracts and can see the deduction in GANACHE that is gas fee that you have to pay for the transx.
NOW we can open truffle console (THIS IS A JS runtime ENV that lets you to use blockchain) to interact with the smart contracts on blockchain :
Run - truffle console
- tokenFarm = await TokenFarm.deployed()
- tokenFarm.address (This is smart contract address)
- name = await tokenFarm.name()
- name (This is the name we have passed in the TokenFarm.sol)

2) package-lock.json - Contains all dependencies 

3) truffle-config.js - Contains the code how we connect the truffle project to blockchain.

4) migration (deploy contracts) - Put new smart contracts in blockchain , that is what migration is migrate from one place to another. OR Blockchain state actually changes whenever you put new smart contract on it because you are creating tranxs since you're migrating the state of the blockchain from one state to another.