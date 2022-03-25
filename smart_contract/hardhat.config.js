require('@nomiclabs/hardhat-waffle') //Waffle es un plugin para construir test de smart contracts

module.exports = {
  solidity: '0.8.0',
  networks: {
    ropsten: {
      url: 'https://eth-ropsten.alchemyapi.io/v2/MDOo5RT-93NMhHjJu03s1s8IkA-DREpF',
      accounts: ['cac956560467aa2492234c2c91426b0c7731f45a5fb1fa63fcd1243ed1be6761'],
    }
  }
}