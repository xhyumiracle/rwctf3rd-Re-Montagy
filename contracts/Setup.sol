pragma solidity ^0.5.11;

import "./Montagy.sol";

contract Setup {
    Montagy public montagy;

    constructor(bytes memory _p2) public payable{
        montagy = new Montagy();
        montagy.registerCode(_p2);
        montagy.newPuzzle(_p2);

        montagy_addr address payable = address(uint160(address(montagy)));
        montagy_addr.transfer(msg.value);
    }

    function isSolved() public view returns (bool) {
        return address(montagy).balance == 0;
    }
}
