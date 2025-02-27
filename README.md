# Dockerized Anvil Ethereum Node

This project provides a Docker image to easily run an Anvil Ethereum node with configurable settings for testing and development. By using environment variables, you can customize the node to match your requirements without changing the Dockerfile.

Anvil is a tool from the Foundry suite that simulates an Ethereum blockchain, making it ideal for testing smart contracts and blockchain applications.

## Features

- **Customizable Network Configuration**: Set chain ID, block time, account count, balance, and mnemonic through environment variables.
- **Flexible Deployment**: Use `docker run` or `docker-compose` to configure and deploy your custom Ethereum node.
- **Ideal for CI/CD Pipelines**: Spin up an isolated blockchain environment for testing in automated workflows.

## Default Configuration

The Docker image is set up with the following default values:

- **Chain ID**: 1337
- **Block Time**: 0 seconds (instant mining)
- **Accounts**: 10 pre-funded accounts
- **Balance**: 1000 ETH (in wei)
- **Mnemonic**: "test test test test test test test test test test test junk"

You can override these defaults by setting environment variables as described below.

## Environment Variables

| Environment Variable                 | Default Value   | Description                                                       | Category                    |
| ------------------------------------ | --------------- | ----------------------------------------------------------------- | --------------------------- |
| **ACCOUNTS**                         | 10              | Number of accounts to generate                                    | General Options             |
| **AUTO_IMPERSONATE**                 | (empty)         | If set to "true", automatically impersonate addresses             | General Options             |
| **BLOCK_TIME**                       | (empty)         | Time interval (in seconds) between blocks                         | General Options             |
| **BALANCE**                          | 10000           | Initial balance (in wei, gwei, etc.) assigned to each account     | General Options             |
| **CONFIG_OUT**                       | (empty)         | File path to write out configuration settings                     | General Options             |
| **DERIVATION_PATH**                  | m/44'/60'/0'/0/ | HD wallet derivation path for generating accounts                 | General Options             |
| **DUMP_STATE**                       | (empty)         | File path to dump the current state                               | General Options             |
| **HARD_FORK**                        | latest          | Ethereum hard fork version to simulate (e.g., "london", "berlin") | General Options             |
| **INIT_GENESIS**                     | (empty)         | File path for initializing genesis state                          | General Options             |
| **IPC**                              | (empty)         | File path for the IPC socket                                      | General Options             |
| **LOAD_STATE**                       | (empty)         | File path to load a previously dumped state                       | General Options             |
| **MNEMONIC**                         | (empty)         | Mnemonic phrase used for generating deterministic accounts        | General Options             |
| **MNEMONIC_RANDOM**                  | (empty)         | When set, generates a random mnemonic                             | General Options             |
| **MNEMONIC_SEED_UNSAFE**             | (empty)         | Unsafe mnemonic seed (use with caution)                           | General Options             |
| **MAX_PERSISTED_STATES**             | (empty)         | Maximum number of states to persist (if state-dumping is enabled) | General Options             |
| **MIXED_MINING**                     | (empty)         | Enables mixed mining mode when set to "true"                      | General Options             |
| **NO_MINING**                        | (empty)         | Disables mining if set to "true"                                  | General Options             |
| **ORDER**                            | fees            | Transaction ordering strategy (e.g., by fees)                     | General Options             |
| **PORT**                             | 8545            | Port for the RPC server                                           | General Options             |
| **PRESERVE_HISTORICAL_STATES**       | (empty)         | Preserves historical states if set to "true"                      | General Options             |
| **PRUNE_HISTORY**                    | (empty)         | Prunes old transaction history if set to "true"                   | General Options             |
| **STATE_INTERVAL**                   | (empty)         | Interval for taking state snapshots                               | General Options             |
| **STATE**                            | (empty)         | Specifies the initial state configuration                         | General Options             |
| **TIMESTAMP**                        | (empty)         | Overrides the block timestamp                                     | General Options             |
| **TRANSACTION_BLOCK_KEEPER**         | (empty)         | Enables a transaction block keeper for state management           | General Options             |
| **VERSION**                          | (empty)         | Version information (typically used for debugging)                | General Options             |
| **ALLOW_ORIGIN**                     | *               | Allowed origins for Cross-Origin Resource Sharing (CORS)          | Server Options              |
| **HOST**                             | 0.0.0.0         | Host address on which the RPC server listens                      | Server Options              |
| **NO_CORS**                          | (empty)         | Disables CORS if set to "true"                                    | Server Options              |
| **NO_REQUEST_SIZE_LIMIT**            | (empty)         | Disables the request size limit if set to "true"                  | Server Options              |
| **COMPUTE_UNITS_PER_SECOND**         | 330             | Compute units per second used for gas estimation                  | Forking Options             |
| **FORK_URL**                         | (empty)         | URL of the blockchain node to fork from                           | Forking Options             |
| **FORK_BLOCK_NUMBER**                | (empty)         | Specific block number to fork from                                | Forking Options             |
| **FORK_CHAIN_ID**                    | (empty)         | Chain ID of the network to fork                                   | Forking Options             |
| **FORK_HEADER**                      | (empty)         | Additional header options for forking                             | Forking Options             |
| **FORK_RETRY_BACKOFF**               | (empty)         | Duration to wait before retrying a failed fork connection         | Forking Options             |
| **FORK_TRANSACTION_HASH**            | (empty)         | Specific transaction hash to fork from                            | Forking Options             |
| **NO_RATE_LIMIT**                    | (empty)         | Disables rate limiting if set to "true"                           | Forking Options             |
| **NO_STORAGE_CACHING**               | (empty)         | Disables storage caching if set to "true"                         | Forking Options             |
| **RETRIES**                          | 5               | Number of retry attempts for fork connections                     | Forking Options             |
| **TIMEOUT**                          | 45000           | Request timeout in milliseconds                                   | Forking Options             |
| **BASE_FEE**                         | (empty)         | Base fee per gas unit (used for block fee calculations)           | Executor Environment Config |
| **CHAIN_ID**                         | 31337           | Chain ID for the simulated blockchain                             | Executor Environment Config |
| **CODE_SIZE_LIMIT**                  | (empty)         | Maximum allowed contract code size                                | Executor Environment Config |
| **DISABLE_BLOCK_GAS_LIMIT**          | (empty)         | Disables the block gas limit if set to "true"                     | Executor Environment Config |
| **DISABLE_CODE_SIZE_LIMIT**          | (empty)         | Disables the contract code size limit if set to "true"            | Executor Environment Config |
| **DISABLE_MIN_PRIORITY_FEE**         | (empty)         | Disables the minimum priority fee if set to "true"                | Executor Environment Config |
| **GAS_LIMIT**                        | (empty)         | Default gas limit per block                                       | Executor Environment Config |
| **GAS_PRICE**                        | (empty)         | Default gas price                                                 | Executor Environment Config |
| **ALPHANET**                         | (empty)         | Enables Alphanet mode if set to "true"                            | EVM Options                 |
| **AUTO_UNLOCK**                      | (empty)         | Automatically unlocks accounts if set to "true"                   | EVM Options                 |
| **DISABLE_CONSOLE_LOG**              | (empty)         | Disables console logging if set to "true"                         | EVM Options                 |
| **DISABLE_DEFAULT_CREATE2_DEPLOYER** | (empty)         | Disables the default CREATE2 deployer if set to "true"            | EVM Options                 |
| **MEMORY_LIMIT**                     | (empty)         | Memory limit allocated for the EVM                                | EVM Options                 |
| **OPTIMISM**                         | (empty)         | Enables Optimism mode if set to "true"                            | EVM Options                 |
| **STEPS_TRACING**                    | (empty)         | Enables detailed step tracing if set to "true"                    | EVM Options                 |
| **JSON_LOGS**                        | (empty)         | Outputs logs in JSON format if set to "true"                      | Display Options             |
| **QUIET_MODE**                       | (empty)         | Minimizes output if set to "true"                                 | Display Options             |
| **VERBOSE_MODE**                     | (empty)         | Increases logging verbosity if set to "true"                      | Display Options             |


## Quick Start

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/romangzz/anvil.git
   cd anvil-docker
   ```

2. **Build the Docker Image**:

   ```bash
   docker build -t anvil-node .
   ```

3. **Run the Docker Container with Default Settings**:

   ```bash
   docker run -p 8545:8545 anvil-node
   ```

   This will start the Anvil node with the default settings, exposing it on `http://localhost:8545`.

## Customizing Configuration with Environment Variables

You can customize the node configuration by specifying environment variables with the `docker run` command:

```bash
docker run -p 8545:8545 \
    -e CHAIN_ID=42 \
    -e BLOCK_TIME=10 \
    -e ACCOUNTS=15 \
    -e BALANCE="2000000" \
    -e MNEMONIC="another mnemonic phrase for testing" \
    anvil-node
```

Or, if you’re using `docker-compose`, create a `docker-compose.yml` file:

```yaml
version: "3"
services:
  anvil:
    image: anvil-node
    ports:
      - "8545:8545"
    environment:
      - CHAIN_ID=42
      - BLOCK_TIME=10
      - ACCOUNTS=15
      - BALANCE=2000000
      - MNEMONIC="another mnemonic phrase for testing"
```

Then run:

```bash
docker-compose up
```

## Docker Hub Repository

You can pull the pre-built Docker image directly from [Docker Hub](https://hub.docker.com/repository/docker/romangzz/anvil):

To use the image from Docker Hub, simply run:

```bash
docker pull romangzz/anvil
```

Or use it directly in your docker run commands:

```bash
docker run -p 8545:8545 romangzz/anvil
```

## Connecting to the Node

Once the container is running, you can connect to the Anvil Ethereum node at `http://localhost:8545`. Use this URL in your development tools and scripts to simulate blockchain interactions as if you were on a real Ethereum network.

## Contributing

If you’d like to contribute to this project, please fork the repository and make your changes in a feature branch. Feel free to submit pull requests with new features or improvements!

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
