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

The following environment variables allow you to customize the Anvil node:

| Variable     | Description                                | Default Value                                                   |
| ------------ | ------------------------------------------ | --------------------------------------------------------------- |
| `CHAIN_ID`   | Chain ID of the network                    | `1337`                                                          |
| `BLOCK_TIME` | Time in seconds between mined blocks       | `0` (instant mining)                                            |
| `ACCOUNTS`   | Number of accounts with pre-funded ETH     | `10`                                                            |
| `BALANCE`    | Balance in wei for each pre-funded account | `1000000` (1,000,000 ETH)                                       |
| `MNEMONIC`   | Mnemonic phrase for generating accounts    | `"test test test test test test test test test test test junk"` |

## Quick Start

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/romanovich23/anvil-node.git
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

You can pull the pre-built Docker image directly from [Docker Hub](https://hub.docker.com/repository/docker/romanovich23/anvil-node):

To use the image from Docker Hub, simply run:

```bash
docker pull romanovich23/anvil-node
```

Or use it directly in your docker run commands:

```bash
docker run -p 8545:8545 romanovich23/anvil-node
```

## Connecting to the Node

Once the container is running, you can connect to the Anvil Ethereum node at `http://localhost:8545`. Use this URL in your development tools and scripts to simulate blockchain interactions as if you were on a real Ethereum network.

## Contributing

If you’d like to contribute to this project, please fork the repository and make your changes in a feature branch. Feel free to submit pull requests with new features or improvements!

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
