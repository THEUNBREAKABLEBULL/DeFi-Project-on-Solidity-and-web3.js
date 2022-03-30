pragma solidity >=0.5.0<8.0.12;

import "./DaiToken.sol";
import "./DappToken.sol";

contract TokenFarm {
    string public name = "DAPP program";
     DaiToken public daiToken ;
     DappToken public dappToken;
     address public owner;

    address[] public stakers;
    mapping(address => uint) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;

    constructor (DaiToken _daiToken, DappToken _dappToken) public { 
        //DaiToken and Dapptoken is smart contract type and _daitoken and _dappToken is variable to pass the address.
        daiToken = _daiToken;
        dappToken = _dappToken; 
        owner = msg.sender; //Person who is interacting with smrt contrts
        // declared daiToken and dappToken above outside the constructor also so that it can be used later also.
        }
    //1 Stakes Tokens (DEPOSIT)
        function stakeTokens(uint _amount) public {
         // Require amount greater than 0
        require(_amount > 0, "amount cannot be 0");

        // Trasnfer Mock Dai tokens to this contract for staking
        daiToken.transferFrom(msg.sender, address(this), _amount);

        // Update staking balance
        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

        // Add user to stakers array *only* if they haven't staked already
        if(!hasStaked[msg.sender]) {
            stakers.push(msg.sender);
        }

        isStaking[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }

     //2 Unstaking Tokens (Withdraw)
    function unstakeTokens() public {
        // Fetch staking balance
        uint balance = stakingBalance[msg.sender];

        // Require amount greater than 0
        require(balance > 0, "staking balance cannot be 0");

        // Transfer Mock Dai tokens to this contract for staking
        daiToken.transfer(msg.sender, balance);

        // Reset staking balance
        stakingBalance[msg.sender] = 0;

        // Update staking status
        isStaking[msg.sender] = false;
    }

        
    //3 Issuing Tokens
    function issueTokens() public {
        // Only owner can call this function or issue tokens
        require(msg.sender == owner, "caller must be the owner");

        // Issue tokens to all stakers
        for (uint i=0; i<stakers.length; i++) {
            address recipient = stakers[i];
            uint balance = stakingBalance[recipient];
            if(balance > 0) {
                dappToken.transfer(recipient, balance);
            }
        }
    }

}