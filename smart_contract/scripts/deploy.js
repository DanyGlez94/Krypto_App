const main = async () => {
  const Transactions = await hre.ethers.getContractFactory("Transactions"); //Esta línea es como una clase que genera instancias de ese contrato en específico
  const transactions = await Transactions.deploy();

  await transactions.deployed();

  console.log("Transactions deployed to: ", transactions.address);
}

const runMain = async () => { 
  try {
    await main(); //La función Main es la responsable de hacer deploy del contrato
    process.exit(0); //Cero es que la operación fue exitosa
  } catch (error) {
    console.error(error);
    process.exit(1); //1 es que hubo un error
  }
}

runMain();

//Cuando este script se ejecute, se hará deploy de las transacciones, y después, obtendremos la dirección del
//deploy de nuestro smart contract en el blockchain.
//Pero para que podamos hacer deploy, debemos de tener algo de ethereum en nuestro propio wallet, porque todo lo que hacemos
//en el network de ethereum requiere algo llamado gas, que son unas pequeñas fracciones de eth para hacer que algo pase