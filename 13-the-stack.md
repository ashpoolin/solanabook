# Appendix A
## The Solana Stack

There are 8 core innovations that make the Solana network possible. These are:
* Proof of History (POH) — a clock before consensus;
* Tower BFT — a PoH-optimized version of PBFT;
* Turbine — a block propagation protocol;
* Gulf Stream — Mempool-less transaction forwarding protocol;
* Sealevel — Parallel smart contracts run-time;
* Pipelining — a Transaction Processing Unit for validation optimization
* Cloudbreak — Horizontally-Scaled Accounts Database; and
* Replicators — Distributed ledger store

### Proof of History (POH) - A Clock Before Consensus
Proof of History (POH) is a unique innovation that lies at the heart of Solana's blockchain. It functions as a decentralized clock, allowing the network to reach consensus more efficiently. POH leverages cryptographic techniques to generate a secure and verifiable timestamp for each transaction, eliminating the need for heavy computational resources. It works by using a sequential pre-image resistant hash function that is applied to a seed, generating a chain of hashes. Each hash in the chain represents a "tick" in the POH clock, which in turn timestamps the transactions, allowing the network to agree on the order of events without significant overhead.

### Tower BFT - A PoH-Optimized Version of PBFT
Tower Byzantine Fault Tolerance (BFT) is a consensus algorithm specifically designed for Solana, building upon the foundation of Proof of History. It is an optimized version of the Practical Byzantine Fault Tolerance (PBFT) algorithm, tailored to leverage POH's unique ability to provide a verifiable, decentralized clock. The integration of POH allows for faster agreement among nodes and validators, ensuring high throughput and low latency transaction processing.

### Turbine - A Block Propagation Protocol
Turbine is Solana's block propagation protocol that addresses the issue of data transmission and sharing among nodes in a distributed network. It is designed to efficiently handle the high volume of data required for fast transaction processing. Turbine breaks down data into smaller packets, which are then forwarded to other nodes in the network using a randomized and recursive process. This approach helps reduce latency, minimize data duplication, and ensure rapid propagation of information across the network.

### Gulf Stream - Mempool-less Transaction Forwarding Protocol
Gulf Stream is a protocol that enables mempool-less transaction forwarding within the Solana ecosystem. Mempools are traditionally used to store pending transactions before they are added to a block. However, Gulf Stream eliminates the need for mempools by directly forwarding transactions to validators, based on the expected confirmation time. This leads to faster transaction processing, lower memory usage, and reduced network congestion.

### Sealevel - Parallel Smart Contracts Run-Time
Sealevel is Solana's parallel smart contracts runtime environment, designed to process multiple smart contracts simultaneously. It leverages the capabilities of modern hardware, such as multi-core processors, to enable parallel execution of transactions. This optimizes the throughput of the network and significantly improves overall performance, allowing Solana to handle thousands of transactions per second.

### Pipelining - A Transaction Processing Unit for Validation Optimization
Pipelining is a transaction processing technique employed by Solana to further enhance network performance. It divides the validation process into smaller stages, which are then executed in parallel by different validators. This streamlines the validation process and allows for efficient utilization of computational resources, ultimately leading to faster transaction processing and reduced latency.

### Cloudbreak - Horizontally-Scaled Accounts Database
Cloudbreak is a horizontally-scaled accounts database, designed to manage the growing number of accounts on the Solana network. It is built on top of RocksDB, a high-performance key-value store, and employs a sharding mechanism to distribute data across multiple storage nodes. This allows for better scalability and ensures that the network can handle an increasing number of accounts and transactions without any degradation in performance.

### Replicators - Distributed Ledger Store
Replicators are an essential component of Solana's decentralized ledger storage system. They are nodes that store copies of the ledger, ensuring data redundancy and security in the network. Replicators download and verify the ledger data, then store it in an efficient and compressed format. They serve as a backup and help maintain the network's overall integrity