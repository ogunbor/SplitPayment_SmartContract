pragma solidity 0.7.5;

contract SplitPayment {
    
    address owner;
    
    constructor (address _owner) {
        owner = _owner;
    }
    
    function send(address payable[] memory to, uint[] memory amount) public payable onlyOwner {
         require(to.length == amount.length, 'to must be same length as amount');
        for(uint i = 0; i < to.length; i++){
          to[i].transfer(amount[i]); 
        }
        
       
    }
     modifier onlyOwner() {
            require(msg.sender == owner, 'Only owner can send');
            _;
        }
    
}