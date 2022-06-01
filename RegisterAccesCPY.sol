//Begin
// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
// Array
 
contract RegisterAccess {
    string[] private info;
    address public owner; //direccion de la persona que hace el smartcontract
    mapping (address => bool) public whiteList; //"llave alor" (control de acceso)
 
    constructor() { //funcion ejecutada en la creación del smart contract
        owner = msg.sender;
        whiteList[msg.sender] = true;
    }
 
    event InfoChange(string oldInfo, string newInfo); //es para decir que la informacion antigua es una y newInfo es la nueva
   
    modifier onlyOwner { //dice que el unico que puede modificar el es owner
        require(msg.sender == owner,"Only owner"); //requerimiento que sea el owner y si no lo es envia el mensaje. si lo es continua
        _; //es como que en el _ se pega la funcion que modifica
    }
 
    modifier onlyWhitelist { //solo la persona de la wl puede hacer cosas si no está mensaje, si está contunuar con el código
        require(whiteList[msg.sender] == true, "Only whitelist"); 
        _;
    }
 
    function getInfo(uint index) public view returns (string memory) {
        return info[index];
    }
 
    function setInfo(uint index, string memory _info) public onlyWhitelist { //parametro es la posición de la info
        emit InfoChange (info[index], _info);
        info[index] = _info;
    }
   
    function addInfo(string memory _info) public onlyWhitelist returns (uint index) { //retorna la posicion de la información
        info.push (_info);
        index = info.length -1;
    }
       
    function listInfo() public view returns (string[] memory) { //ver las modificacione (cualquier persona puede ver esto), (vigilar si hay muchos datos será muy caro chekear, mejor limitarlo)
        return info; //Evitar un array dinamico a toda costa, como les había dicho la tx puede retornar "out of gas" por siempre 
    }
 
    function addMember (address _member) public onlyOwner { //add member to whitelist
        whiteList[_member] = true;
    }
   
    function delMember (address _member) public onlyOwner { //delete member from wl
        whiteList[_member] = false;
    }    
}
 
//End
