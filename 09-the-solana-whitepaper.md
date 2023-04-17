# Chapter 9
## The Solana Whitepaper

Solana's whitepaper is quite formidable for those who are new to blockchains and unfamiliar with distributed systems. Don't fret--this chapter condenses the information and attempts to make its ideas more accessible. This section is for users who want to understand the system's operating principles, and key innovations that sets Solana apart from other blockchains.

The complete text of the Solana whitepaper can be found here: [https://solana.com/solana-whitepaper.pdf](https://solana.com/solana-whitepaper.pdf).

### Whitepaper Structure
Besides introductory information (abstract, introduction, and outline), the paper's sections 3 through 7 have the real substance that define Solana and how it works. These items are:
* Section 3: Network Design   
* Section 4: Proof of History (PoH)
* Section 5: Proof of Stake (PoS) Consensus
* Section 6: Proof of Replication (PoRep)
* Section 7: System Architecture and Performance

We'll take some time to unpack each of these section in the remainder of this chapter.

### Network Design
System nodes that validate transactions and create blocks are called validators. At any one time, and when the blockchain is in a non-partitioned state (e.g. not "forking"), there is only one leader. Transactions or user messages are sent to the leader to be verified, sequenced and written to state. The leader propagates the messages to the verifiers (non-leader validators), which then use their own in-memory state to compute signatures, which serve as a *vote* on the correct, new state of the network. As it relates to the computer science CAP Theorem, in the event of a fork, consistency is almost always picked over availability. This means that every *read* of state receives the most recent *write* or an *error*, versus every request receives a [non-error] response, without the guarantee that it contains the most recent write. This strictness reduces errors propagating through the network, and helps facilitate catching and handling partitions quickly. 

### Proof of History (PoH)
This section establishes the novel use of the SHA256 hashing algorithm to create a sort of "cryptographic clock." A SHA256 hash is a cryptographic function for which the output cannot be determined from the input, without actually performing the function. That is, in order to get the result, you must indeed do the work of running the the function. Proof of history requires that the node run the SHA256 hashing function repeatedly, looping the result back into its input, and optionally appending data to the input, which effectively timestamps and enshrines data to have entered the state at a particular place in time. Combining this operation with a counter that increments up with each hash performed, you now have a timekeeping element with ticks measured in the nanoseconds range. Each hash output doesn't need to be stored, however, it is enough to capture the output after a sequence of, say, 100 hashes has run. 

input --> SHA256 / += counter --> output
+ user message (transaction)
  <--------------------
                              --> counter

<example hash table>

Since the hashing function requires the previous hash as input, it must be run serially on a single core. The hashing function must be *collision* resistant (SHA256 is), otherwise it would be possible to run the computation on multiple processor cores, thereby subverting the assurance that our clock is reliable in determining time. In general, the whole ritual is effectively a *proof of work* to securely demonstrate time has elapsed, since each sequence has required some discrete amount of computational work to be completed to arrive at the current output. Since the implementation does not easily convey its intended function, we'll state it expressly: proof of history is a crytographically-assured vehicle to establish the chronology of events, and the passage of time. The system makes it impossible to precompute future hash sequences, based on [prior] knowledge of the data that will be included in the sequence. Altogether, this thwarts anyone who would throw gobs of computing resources at the algorithm, with the intent to reorganize the chain, or create invalid blocks (a so-called *double spend attack*).

Although the PoH algorithm can only be run on a single processor core, it can be verified with a multi-core processor, and in much less time than it takes to generate its output. Since we have a running table of PoH inputs, outputs, state, and the counter, we can split each of these records up, and dispatch them to more cores on a CPU or GPU. Each output of a sequence is verified in parallel, and in a fraction of the time it took to originally run. Where it took the time T to run an arbitrary batch of hash sequences, it should take approximately T/N to verify, where N is the number of cores used for verification.

### Proof of Stake (PoS) Consensus
### Proof of Replication (PoRep)
### System Architecture and Performance

### Glossary
