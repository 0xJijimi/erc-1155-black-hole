## ERC-1155 BLACK HOLE

The ERC1155BlackHole contract is a simple implementation designed to permanently receive and hold ERC1155 tokens. It has the following features:

- Acts as an ERC1155 token receiver
- Prevents accidental sending of non-ERC1155 tokens (including Ether)
- Immutable design with no ability to withdraw or transfer received tokens

This contract can be used as a "black hole" for burning or permanently locking ERC1155 tokens.

## Deploy

```
$ forge create ERC1155BlackHole --rpc-url <testnet-or-mainnet-url> --interactive
```
