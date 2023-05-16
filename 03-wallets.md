# Chapter 3
## Wallets

### Introduction
In this chapter, we will explore the different types of wallets available for the Solana blockchain. These wallets offer secure storage for your Solana tokens and provide easy access to the Solana network. We will cover some of the widely used wallets, describe specific features and support to look out for, and follow up with a very basic discussion on keypairs, seed phrases, and using the Solana CLI to manage a wallet directly at the command line.

### Popular Wallets
The following is a list of the most popular wallets used on Solana, but it is not exhaustive. Here, the user really has a great selection to choose from. Inclusion in this list is not an endorsement of any wallet, but aims to describe some of their defining features and reasons users may choose one over another.

#### Solflare
Solflare is a browser extension wallet that provides a user-friendly interface for storing and managing Solana tokens. Designed to be compatible with Solana's seamless on-chain transactions, Solflare offers secure storage for your tokens along with access to relevant transaction history. It also supports token swapping and staking SOL tokens in the Solana network. With its intuitive interface, this wallet is ideal for both novice and expert users.

#### Phantom
Phantom is a fast and secure desktop wallet that supports both Solana and other chains. Unlike Solflare, it stores your private keys locally, providing increased security and control over your funds. Furthermore, Phantom's user interface is sleek and easy to navigate. It has features like a built-in token swap and staking function for SOL tokens in the Solana network. Phantom supports integration with dApps and NFT marketplaces, making it a popular choice for users who want flexibility and accessibility.

#### Backpack
Backpack is an innovative multi-chain desktop wallet that supports various blockchains, including Solana. Apart from standard transactional and management functions, it pioneered the concept of xNFTs - executable NFTs. xNFTs are a novel type of NFT-based on Smart Contracts, which can carry out various actions based on specific triggers. This allows the use of NFTs beyond just as collectibles but as access tokens, event tickets, and other creative use cases. Backpack's xNFTs adoption empowers creators and developers with new ways to make their NFTs dynamic, interactive and engaging.              

#### Solana CLI
Solana CLI is a command-line interface wallet that lets users access the Solana network through the terminal window. It is a popular choice for developers and users who prefer to interact with the network using command lines, allowing for automation and customization of tasks. It's also an excellent tool for debugging and testing, making it an indispensable asset for developers.

### Wallet Features
Wallet selection is not a trivial task, and this is by no means a definitive how-to guide. Our best advice is to try many wallets (with good reputations), and see which are most intuitive to you, and thatyou are the most comfortable with. Many wallets can provide adequate security, and this is *mostly* contingent on the user protecting their seed phrase (there are exceptions that will go unnamed here). However, there are other features that may increase safety, and user enjoyment. We'll go through these features in the following sections.

#### SPL tokens
All wallets should support the use of SPL-tokens, Solana's equivalent to an ERC-20 on Ethereum. SPL-tokens each have one or more addresses called an associated token account, or ATA. The ATA is where information related to the token is stored, including the balance and base58 mint address for the token.

#### NFTs
A type of SPL-token with a mint quantity of one (1) is a non-fungible token, or NFT. Again, every wallet should support this type of token. An NFT is slightly different in that it contains metadata, and will likely contain information such as a link to an image (probably a monkey or dog), and various traits of the NFT. Wallets have different means of organizing NFTs within the wallet, which can help the user separate legitimate NFTs from spam, which is plentiful, due to Solana's low mint and transaction costs.

#### xNFT
A novel type of NFT called the xNFT (executable NFT) was introduced to Solana by the Backpack wallet team. xNFT are similar to NFTs, with the distinction that their token data may contain arbitrary or executable code inside. This allows the wallet to behave more like an app store, to provide a more moderated experience, enhanced security for executables, and for the user to benefit from greater trust between an xNFT app or collection. The executable data can be updated to create interactive and more feature-rich experiences with users.   

#### Staking
Solana is a proof-of-stake network, so a big part of network participation is staking. That is, committing your coins to the consensus ritual, and in exchange, the user is paid both a portion of the chain's transaction fees, as well as inflationary emissions. Staking allows the user to put their coins to work in securing the network, and also stave off devaluation by the natural token emissions of the protocol. The best staking experience is currently with Solflare, but Phantom is also painless and pleasant to use here.

#### Priority Fees
At the current time, there are not many wallets that support the use of the priority fee ("additional fee"), but this number should only grow. The Backpack wallet does in fact support setting of a priority fee rate when enabled using the developer mode. The priority fee can also be set by a dApp, so it is not expressly necessary to have it supported in the wallet to benefit from it (although we greatly prefer wallets that can do it out of the box). Using priority fees is likely not necessary for basic transfers, but may make the difference when submitting trades on DeFi protocols, NFT trading platforms, or trying to win a hotly contested NFT mint. In general, priority fee support is great insurance that you can get what you need to do done, even during times of congestion, or when interacting with popular pieces of state (dApps).

A brief word on priority fees: each transaction has a maximum number of "compute units" (cu) available for it to use. This limit can be set by the `setComputeUnitLimit` instruction of the `ComputeBudget` program, and there are global limit to the maximum compute units a transaction can consume (currently 1.4M cu/transaction). The unused fee paid for compute units will not be collected from the user. To set the "price" for an additional fee, you send a `SetComputeUnitPrice` instruction. The units for expressing this "price" for the `additional_fee` is painfully obscure, as it is measured in microlamports-per-compute unit. Further, you will notice it is not actually a fee, but a rate, which further complicates estimating how much you can expect to pay for a transaction. Good wallets are starting to abstract this away, but until it's the norm, it is worthwhile to understand how to do it. Each lamport is 10^-9 SOL, and a microlamport (uL) is 10^-6 lamports, so each microlamport (or priority rate unit) is 10^-15 SOL (10^-15 SOL/cu). To figure out the additional fee, multiply the rate by 10^-15 SOL/uL, then by the max compute units you expect the transaction to consume. Add in the base fee, and you'll have the total cost of the transaction fee. Like so:

```
total fee = base fee + priority fee
total fee = base fee + compute unit limit * additional_fee * 10^-15
units:
sol = sol + cu * uL/cu * 10^-15 SOL/cu = sol
Example: calculate the (maximum) total fee assuming an additional fee rate of 1000 uL/cu, and a max compute units of 200,000 cu.
(maximum) total fee = 0.000005 + 200,000 * 1,000 * 10^-15 = 0.0000052 SOL = 5.2 * 10^-6 SOL
```

#### Multicoin UX
Some wallets now support tokens on multiple chains. Again, this list is non-exhaustive, but currently Backpack and Phantom have introduced ether / EVM addresses, that are derived from common seed phras(es) of the Solana keypair(s) that the wallet creates. At this time, the author is unfamiliar with each wallet's level of hardware wallet support. The prospect of using a single wallet for multiple chains greatly reduces the burden to the user of securing multiple keypairs / seed phrases, however, it may also magnify losses should a private key be compromised. Regardless, being able to access all or most of your coins from a single wallet is undeniably an attractive feature. 

#### Cross-Chain Support
No wallets currently support bridging from one chain to another, but we expect this may happen in the future. The Wormhole / Portal bridge has an API for bridging now, which, when integrated into a wallet, might provide some abstraction for the Wormhole protocol, and greatly enhance user experience, while enabling a truly multi-chain experience.

### Security
 
#### Seed Phrase Creation

### Use a Hardware Wallet

### Use a Hot Wallet

### Solana CLI

### Summary
As the Solana network continues to grow, the number of wallets available continues to increase, providing users with more and better options to store and manage their tokens. Regardless of your level of experience or needs, there is a wallet suitable for you. From browser extension wallets like Solflare, desktop wallets like Phantom and Backpack to command-line wallets like Solana CLI, there is something for every user. Don't forget about innovative new developments like xNFTs, allowing the Solana network to include NFTs with executable smart contract functions.