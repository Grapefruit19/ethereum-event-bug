# Background

I'm experiencing a bug in which events do not show up properly in their receipts.

When events across multiple contracts are called (i.e., ParentContract calls the Logger contract to log out an event), the events do not display in their receipts (see the contract ParentContract for details).

This bug occurs with versions of truffle greater than 4.1.3, up to and including 4.1.13. 

This bug occurs with the current version of Geth (as well as older versions) and the current version of Quorum. It does not occur with ganache-cli, which makes me suspect it's an issue with Geth (which Quorum is a fork of). In particular, I believe it's an issue with solc, as the jump from 4.1.3 to 4.1.4 updates solc from 0.4.19 to 0.4.21.

# Steps to Reproduce

1. Clone this repository
2. Spin up an instance of Geth for test purposes.
3. With the latest version of truffle (version 4.1.13), run `truffle migrate --network local --reset`. This will migrate the contracts, send the transaction that fires both events, and log out the transaction receipt. Output should look something like this:

```
{ tx: '0xed56e905b638927bcf2a8a625df213805662c2c9e5987c8f4c83b8d89b1567e7',
  receipt:
  { blockHash: '0x24f04a1b8d8bf8a7d291c14b4e2c61b6ca6b2783e4988660d65916628a99157c',
    blockNumber: 5402,
    contractAddress: null,
    cumulativeGasUsed: 6721975,
    from: '0xcd53d707046431992698e2046f16430c4175694f',
    gasUsed: 6721975,
    logs: [],
    logsBloom: '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
    root: '0x5e9b690d34b97253026e20c3152edf40e532bdfefb48d6f494c4b040c9e8eb74',
    to: '0xa9c143794d72c2bf0aa84118c6d5f3f68973772c',
    transactionHash: '0xed56e905b638927bcf2a8a625df213805662c2c9e5987c8f4c83b8d89b1567e7',
    transactionIndex: 0 },
  logs: [] }
  ```

  If the transaction receipt doesn't appear, then you need to rerun the migration script (not sure why it's non deterministic, perhaps that's a bug in itself).

  4. Run `npm install -g truffle@4.1.3` to download an older version of truffle. Delete the contents of the `build` folder and rerun the `truffle migrate` command above. 

  5. The event logs should appear now.