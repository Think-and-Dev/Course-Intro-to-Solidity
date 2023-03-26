import {HardhatUserConfig} from 'hardhat/config'
import '@nomicfoundation/hardhat-toolbox'
import 'hardhat-deploy'
import 'hardhat-abi-exporter'
import 'hardhat-contract-sizer'

import networks from './hardhat.networks'
import namedAccounts from './hardhat.accounts'

const config: HardhatUserConfig = {
  solidity: '0.8.18',
  networks,
  namedAccounts,
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  },
  abiExporter: {
    path: './abis',
    runOnCompile: false
  },
  gasReporter: {
    currency: 'USD',
    gasPrice: 30,
    enabled: process.env.REPORT_GAS ? true : false
  }
}

export default config
