#!/usr/bin/env bash
set -e

# Build an array of command line arguments to pass to anvil
args=()

# Required options (passed by default if non-empty)
[ -n "${HOST}" ] && args+=(--host "${HOST}")
[ -n "${PORT}" ] && args+=(--port "${PORT}")
[ -n "${CHAIN_ID}" ] && args+=(--chain-id "${CHAIN_ID}")
[ -n "${ACCOUNTS}" ] && args+=(--accounts "${ACCOUNTS}")
[ -n "${BALANCE}" ] && args+=(--balance "${BALANCE}")
[ -n "${DERIVATION_PATH}" ] && args+=(--derivation-path "${DERIVATION_PATH}")
[ -n "${HARD_FORK}" ] && args+=(--hardfork "${HARD_FORK}")
[ -n "${ORDER}" ] && args+=(--order "${ORDER}")
[ -n "${RETRIES}" ] && args+=(--retries "${RETRIES}")
[ -n "${TIMEOUT}" ] && args+=(--timeout "${TIMEOUT}")
[ -n "${COMPUTE_UNITS_PER_SECOND}" ] && args+=(--compute-units-per-second "${COMPUTE_UNITS_PER_SECOND}")
[ -n "${ALLOW_ORIGIN}" ] && args+=(--allow-origin "${ALLOW_ORIGIN}")
[ -n "${COLOR}" ] && args+=(--color "${COLOR}")

# Optional parameters: only add if the variable is non-empty
[ -n "${BLOCK_TIME}" ] && args+=(--block-time "${BLOCK_TIME}")
[ -n "${CONFIG_OUT}" ] && args+=(--config-out "${CONFIG_OUT}")
[ -n "${DUMP_STATE}" ] && args+=(--dump-state "${DUMP_STATE}")
[ -n "${INIT_GENESIS}" ] && args+=(--init "${INIT_GENESIS}")
[ -n "${IPC}" ] && args+=(--ipc "${IPC}")
[ -n "${LOAD_STATE}" ] && args+=(--load-state "${LOAD_STATE}")
[ -n "${STATE}" ] && args+=(--state "${STATE}")
[ -n "${STATE_INTERVAL}" ] && args+=(--state-interval "${STATE_INTERVAL}")
[ -n "${TIMESTAMP}" ] && args+=(--timestamp "${TIMESTAMP}")
[ -n "${TRANSACTION_BLOCK_KEEPER}" ] && args+=(--transaction-block-keeper "${TRANSACTION_BLOCK_KEEPER}")

# Boolean flags (only add if set to "true")
[ "${AUTO_IMPERSONATE}" = "true" ] && args+=(--auto-impersonate)
[ "${MIXED_MINING}" = "true" ] && args+=(--mixed-mining)
[ "${NO_MINING}" = "true" ] && args+=(--no-mining)

[ -n "${MNEMONIC}" ] && args+=(--mnemonic "${MNEMONIC}")
[ -n "${MNEMONIC_RANDOM}" ] && args+=(--mnemonic-random "${MNEMONIC_RANDOM}")
[ -n "${MNEMONIC_SEED_UNSAFE}" ] && args+=(--mnemonic-seed-unsafe "${MNEMONIC_SEED_UNSAFE}")
[ -n "${MAX_PERSISTED_STATES}" ] && args+=(--max-persisted-states "${MAX_PERSISTED_STATES}")
[ "${PRESERVE_HISTORICAL_STATES}" = "true" ] && args+=(--preserve-historical-states)
[ "${PRUNE_HISTORY}" = "true" ] && args+=(--prune-history)
[ "${NO_CORS}" = "true" ] && args+=(--no-cors)
[ "${NO_REQUEST_SIZE_LIMIT}" = "true" ] && args+=(--no-request-size-limit)

[ -n "${FORK_URL}" ] && args+=(--fork-url "${FORK_URL}")
[ -n "${FORK_BLOCK_NUMBER}" ] && args+=(--fork-block-number "${FORK_BLOCK_NUMBER}")
[ -n "${FORK_CHAIN_ID}" ] && args+=(--fork-chain-id "${FORK_CHAIN_ID}")
[ -n "${FORK_HEADER}" ] && args+=(--fork-header "${FORK_HEADER}")
[ -n "${FORK_RETRY_BACKOFF}" ] && args+=(--fork-retry-backoff "${FORK_RETRY_BACKOFF}")
[ -n "${FORK_TRANSACTION_HASH}" ] && args+=(--fork-transaction-hash "${FORK_TRANSACTION_HASH}")
[ "${NO_RATE_LIMIT}" = "true" ] && args+=(--no-rate-limit)
[ "${NO_STORAGE_CACHING}" = "true" ] && args+=(--no-storage-caching)

[ -n "${BASE_FEE}" ] && args+=(--block-base-fee-per-gas "${BASE_FEE}")
[ -n "${CODE_SIZE_LIMIT}" ] && args+=(--code-size-limit "${CODE_SIZE_LIMIT}")
[ "${DISABLE_BLOCK_GAS_LIMIT}" = "true" ] && args+=(--disable-block-gas-limit)
[ "${DISABLE_CODE_SIZE_LIMIT}" = "true" ] && args+=(--disable-code-size-limit)
[ "${DISABLE_MIN_PRIORITY_FEE}" = "true" ] && args+=(--disable-min-priority-fee)
[ -n "${GAS_LIMIT}" ] && args+=(--gas-limit "${GAS_LIMIT}")
[ -n "${GAS_PRICE}" ] && args+=(--gas-price "${GAS_PRICE}")

[ "${ALPHANET}" = "true" ] && args+=(--alphanet)
[ "${AUTO_UNLOCK}" = "true" ] && args+=(--auto-impersonate)
[ "${DISABLE_CONSOLE_LOG}" = "true" ] && args+=(--disable-console-log)
[ "${DISABLE_DEFAULT_CREATE2_DEPLOYER}" = "true" ] && args+=(--disable-default-create2-deployer)
[ -n "${MEMORY_LIMIT}" ] && args+=(--memory-limit "${MEMORY_LIMIT}")
[ "${OPTIMISM}" = "true" ] && args+=(--optimism)
[ "${STEPS_TRACING}" = "true" ] && args+=(--steps-tracing)

[ "${JSON_LOGS}" = "true" ] && args+=(--json)
[ "${QUIET_MODE}" = "true" ] && args+=(--quiet)
[ "${VERBOSE_MODE}" = "true" ] && args+=(--verbose)

echo "Starting anvil with arguments: ${args[@]}"

# Execute anvil with the built arguments
exec anvil "${args[@]}"
