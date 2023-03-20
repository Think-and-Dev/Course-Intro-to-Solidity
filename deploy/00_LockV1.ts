import {HardhatRuntimeEnvironment} from 'hardhat/types'
import {DeployFunction} from 'hardhat-deploy/types'
import {ethers} from 'hardhat'
import {getUnlockTime, printDeploySuccessful, printInfo} from '../utils/utils'

const version = 'v1.0.0'
const ContractName = 'LockV1'

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const {deployments, getNamedAccounts} = hre
  const {deploy} = deployments

  const {deployer} = await getNamedAccounts()

  printInfo(`\n Deploying ${ContractName} contract...`)
  const unlockTime = getUnlockTime()

  const LockV1Result = await deploy(ContractName, {
    args: [unlockTime],
    contract: ContractName,
    from: deployer,
    skipIfAlreadyDeployed: false,
    value: ethers.utils.parseEther('1'),
    autoMine: true
  })

  const lockV1Address = LockV1Result.address

  printDeploySuccessful(ContractName, lockV1Address)

  return true
}

export default func
const id = ContractName + version
func.tags = [id, version]
func.id = id
