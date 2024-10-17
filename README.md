## ERC-1155 BLACK HOLE

## Overview

The ERC1155BlackHole contract is a specialized implementation designed to permanently receive and hold ERC-1155 tokens. This "black hole" contract serves as a mechanism permanently locking ERC-1155 tokens.

## Features

- Acts as an ERC-1155 token receiver
- Prevents accidental sending of non-ERC-1155 tokens (including Ether)
- Immutable design with no ability to withdraw or transfer received tokens

## Use Cases

- Token locking: Securely store tokens without the possibility of retrieval

## Deploy

- Interactive, without verification:

```bash
$ forge create ERC1155BlackHole --rpc-url <testnet-or-mainnet-url> --interactive
```

- Automatic, with verification:

```bash
$ forge script script/ERC1155BlackHole.s.sol:ERC1155BlackHoleScript --broadcast --verify -vvvv --slow --ffi
```

## Security Considerations

- Once tokens are sent to this contract, they cannot be retrieved
- Ensure you're interacting with the correct contract address
- Double-check all transactions before sending tokens

## License

This project is licensed under the [MIT License](LICENSE).
