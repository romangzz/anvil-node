FROM rust:latest

RUN curl -L https://foundry.paradigm.xyz | bash && \
    ~/.foundry/bin/foundryup

ENV PATH="/root/.foundry/bin:${PATH}"

ENV CHAIN_ID=1337
ENV BLOCK_TIME=0
ENV ACCOUNTS=10
ENV BALANCE=1000000
ENV MNEMONIC="test test test test test test test test test test test junk"

EXPOSE 8545

CMD ["sh", "-c", "anvil --host 0.0.0.0 \
    --chain-id ${CHAIN_ID} \
    $( [ ${BLOCK_TIME} -gt 0 ] && echo --block-time ${BLOCK_TIME} ) \
    --accounts ${ACCOUNTS} \
    --balance ${BALANCE} \
    --mnemonic \"${MNEMONIC}\""]

