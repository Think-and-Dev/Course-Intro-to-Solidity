import {HardhatRuntimeEnvironment} from 'hardhat/types'
import {DeployFunction} from 'hardhat-deploy/types'
import {printDeploySuccessful, printInfo} from '../utils/utils'

const version = 'v1.0.0'
const ContractName = 'Cat'

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const {deployments, getNamedAccounts} = hre
  const {deploy} = deployments

  const {deployer} = await getNamedAccounts()

  printInfo(`\n Deploying ${ContractName} contract...`)

  const CatResult = await deploy(ContractName, {
    args: [deployer, 'Mish'],
    contract: ContractName,
    from: deployer,
    skipIfAlreadyDeployed: false,
    autoMine: true
  })

  const catAddress = CatResult.address

  printDeploySuccessful(ContractName, catAddress)

  return true
}

export default func
const id = ContractName + version
func.tags = [id, version]
func.id = id
