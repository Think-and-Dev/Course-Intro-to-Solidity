const networks: any = {
  localhost: {
    chainId: 31337,
    url: 'http://127.0.0.1:8545',
    allowUnlimitedContractSize: true,
    timeout: 1000 * 60
  },
  hardhat: {
    live: false,
    allowUnlimitedContractSize: true,
    tags: ['test', 'local']
  },
  polygon: {
    url: process.env.ALCHEMY_KEY
      ? `https://polygon-mainnet.g.alchemy.com/v2/${process.env.ALCHEMY_KEY}`
      : 'https://speedy-nodes-nyc.moralis.io/237feb2eade8c576d06ac0ae/polygon/mainnet',
    chainId: 137,
    accounts: {mnemonic: process.env.MNEMONIC ? process.env.MNEMONIC : ''}
  },
  mumbai: {
    live: true,
    chainId: 80001,
    url: process.env.ALCHMEMY_KEY
      ? `https://polygon-mumbai.g.alchemy.com/v2/${process.env.ALCHEMY_KEY}`
      : 'https://rpc-mumbai.maticvigil.com',
    accounts: {
      mnemonic: process.env.MNEMONIC ? process.env.MNEMONIC : ''
    },
    allowUnlimitedContractSize: false,
    timeout: 1000 * 60,
    tags: ['testnet']
  }
}

export default networks
