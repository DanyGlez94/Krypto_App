//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0; //Escogemos la versión de solidity

contract Transactions {
    uint256 transactionCount; //variable de tipo numero

    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);
    //Event es como una función, esta función acepta varios parámetros

    struct TransferStruct { //Struct es como un objeto
        //type   value
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }
    //La variable transactions será un arreglo de TransferStruct, o sea, un array de objetos.
    TransferStruct[] transactions;

    //address payable receiver = el primer parámetro es el receiver, que será una payable address
    //uint amount = el monto de la transacción.
    //string memory message = el memory significa que hay datos especificos guardados en la memoria de esa transacción
    //string memory keyword = la palabra 
    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        transactionCount += 1;
        //Agregamos nuestra transferencia con todos sus parametros al array
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword));
        //msg.sender = el objeto msg es algo que obtienes inmediatamente siempre que llamas una función especifica en el blockchain
        //block.timestamp = la hora en que se ejecuto la transacción en el blockchain.

        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    //Esta es una función pública que retorna un array de TransferStruct
    function getAllTransactions() public view returns (TransferStruct[] memory) {
        return transactions;
    }
    //Esta es una función pública que retorna un número
    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }
}