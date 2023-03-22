import {HardhatRuntimeEnvironment} from 'hardhat/types'
import {DeployFunction} from 'hardhat-deploy/types'
import {printDeploySuccessful, printInfo} from '../utils/utils'

const version = 'v1.0.0'
const ContractName = 'SolowToken'

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const {deployments, getNamedAccounts} = hre
  const {deploy} = deployments

  const {deployer} = await getNamedAccounts()

  printInfo(`\n Deploying ${ContractName} contract...`)

  const SolowTokenResult = await deploy(ContractName, {
    args: [1000000],
    contract: ContractName,
    from: deployer,
    skipIfAlreadyDeployed: false,
    autoMine: true
  })

  const solowTokenAddress = SolowTokenResult.address

  printDeploySuccessful(ContractName, solowTokenAddress)

  return true
}

export default func
const id = ContractName + version
func.tags = [id, version]
func.id = id
