FROM ghcr.io/foundry-rs/foundry:latest

# Set PATH so that foundry tools are accessible
ENV PATH="/root/.foundry/bin:${PATH}"

# Expose Anvil's default RPC port
EXPOSE 8545

# Copy the entrypoint script with execute permission
COPY --chmod=0755 entrypoint.sh /entrypoint.sh

# Use the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
