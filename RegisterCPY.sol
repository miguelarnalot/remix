//Begin
// SPDX-License-Identifier: MIT
pragma solidity 0.8.13; //version del compilador
 
contract Register {
        string private info; //variable
   
        function getInfo() public view returns (string memory) { //consultar memoria (es realizada en el nodo local, no cambia nada en la blockchain)
            return info;    //devolver memoria
        }
 
        function setInfo(string memory _info) public { // cambia el estado de la blockchain ()
            info = _info;
        }
}
//End