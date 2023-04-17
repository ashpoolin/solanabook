# Chapter 2
## Solana Basics

### Solana the Blockchain
Solana is a blockchain like many other you may be familiar with. The blockchain differentiates itself from other in its low block times (<400ms), and high transaction throughput (~4000 transactions per second as of writing this in April 2023). The blockchain leverages clever engineering at the software layer, as well as high performance machines (fast multicore CPUs, GPUs, and lots and lots of RAM). used for the validators. With transaction confirmation times less than a second, it gets as close to "instantaneous" as any other chain, currently. 

### Account Model
Like any of the EVM chains you may have used, Solana uses an account model (versus a UTXO model like in bitcoin, or other bitcoin-derived networks). Whereas bitcoin has UTXOs (unspent transaction outputs) to denominate coins on the blockchain, for Solana, everything is just data written to an "account" somewhere. Each account is "owned" by another program. Balances, coin details, and things like lockups are data properties that are stored in the account. The types of information vary by the program to which an account belongs, and the details are essentially limitless (up to the max account size). For coins, Solana accounts are owned by the `system` program, stake accounts by the `stake` program, and SPL tokens (Solana's ERC-20 equivalent) owned by the `spl-token` program. SPL tokens are specifically very useful, as they can represent everything from margin positions, staked assets, collateral held in a borrow-lend program, tokenized real-world assets (RWA), equities and commodities, and non-fungible tokens (NFT). In addition to the account model's ability to represent assets, it is even generally useful as a vehicle for on-chain storage, to represent data points that can only be written to by cryptographic keys, and therefore can be a trusted source of information. The obvious application here is price and data *oracles*, but the data could represent everything from tweets on a decentralized social network, to a security deposit or bank account balance, as random examples.  

### Stateless Programs
While both Ethereum and Solana share an account model, a big departure from ethereum is the fact that Solana programs separate state (data) from execution. What this means is that while a smart contract is executed, it doesn't lock the state for all of the associated program/token accounts. Each program invocation, then, essentially acts as an atomic API call. Accounts that do not have overlapping state changes (requiring sequential execution, where ordering is important) can therefore be executed concurrently. The separation of programs and state allows non-contending transactions to be executed in parallel. As a result, Solana users benefit from the assurance that, if they are not interacting with a popular account (program or dApp), then their transaction should land in a block immediately and be confirmed quickly and affordably. 

### Solana 2.0
This is a set of improvements similar in significance to the Ethereum 2.0 milestone, which Solana reached just a little bit quicker. These two improvements, delivered middle of 2022, are so important to Solana's realization, that they get this title. While the blockchain was already fast, this set of improvements removed the speed bumps that were rendering some services nearly unusable during network congestion, such as dexes during high volatility, or popular NFT mints. The improvements led to an increase in the average *transaction rate* (tx/sec, or *TPS*) to about 4000 TPS, from something that previously ranged 2000-3000 (>33% faster). The demarkation of Solana 2.0 took the network from something that was excellent during the calm times, but buckled under pressure, to a network that could perform under relentless volatility. During the blowup of FTX, Solana continued to confirm transactions around 3000 TPS, while its token experienced terrifying drawdown, and an annualized volatility >600% for over a week! Not even bitcoin or ethereum have experienced such an adverse event. Ultimately, Solana has demonstrated that the network itself is incredibly durable, and with the 2.0 improvements, significantly hardended to congestion, and volatility.

#### Localized Fee Markets
Prior to these 2.0 upgrades, although Solana had stateless execution, it had a different problem: a fixed transaction fee. 

#### Quality of Service
QUIC

### Monolithic versus Modular
An impassioned debate that is not going to be settled soon is the question of whether to use a single, flat, or "monolithic" system  that incorporates consensus, censorship resistance, and the execution environment at a single layer (*layer 1*, or L1), or if another architecture that splits up consensus, data availability (via "shards", for example), and execution is better. The overarching argument is that, with enough usage, every block chain will reach a saturation point with network traffic, and then on-chain fees will need to increase to manage the congestion. The question is about scalability and how best to accomplish it.

#### Layer 2
Indeed, separating consensus (at the L1) and execution (using rollups or layer 2)--the path that Ethereum has gone down--shows promise for adding bandwidth and reducing transaction costs, enabling lower value transactions. This arrangement offloads execution from the L1, and proffers security to the L2. The tradeoff is that the relationship with the L1 has changed based on the design choices of the L2. For instance, while the Ethereum L1 is decentralized, and reasonably censorship resistant, most L2s accomplish their high throughput by using a single transaction sequencer, or in the case of ZK-rollups, a prover, with ambitions to decentralize these components later on. This choice mostly eliminates the censorship resistance of the L2, which may be of consequence for time-sensitive transactions. In short, while there are many benefits to L2s, users of L2s do not have the same assurances for user experience that can be found expected when interacting with the main chain directly. 

#### Composability
A more pressing issue is that, with each new L2, *composability*--the capability of smart contracts to share information and interact or "compose" with one another--is significantly impaired. While a main feature of rollups is that you should be able to bypass a sequencer to send and settle transactions on the main chain, in the case of optimistic rollups, settlement of some types of transactions is contingent on a waiting period (of days-weeks) that is required for verifiers to submit a *fraud proof*.

#### Liquidity
In the case of assets stored on-chain, the use of L2s and disparate execution environments, their subsequent drawbacks related to composability causes a fragmentation of liquidity. That is, since L2 must have assets "bridged" over from the L1, have different security guarantees, and possibly disparate or incompatible execution environments, L2s risk becoming islands of liquidity, because of their inability to interact with other L2s, or even the L1, in a timely manner. During periods of high volatility, it is possible to see departures in the prices of assets on an L2 versus the L1, since they are microcosms of the main chain, with their own dynamics, and limitations that the coins may be unavailable, or temporarily stranded.

#### Monolithic Design
This title is a bit misleading because we don't really consider Solana to be "monolithic" in its design, since, due to the account model and stateless programs, the system's parallel architecture, 

### The Trilemma

### Hardware is the Answer


### Proof of History


