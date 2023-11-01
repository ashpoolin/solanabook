# Appendix A
## Glossary

A list of terms used in the book, providing disambiguation and definitions:
```
- Byzantine Fault Tolerance. 
- CAP Theorem. Also named Brewer's Theorem. States that any distributed data store can provide only two of the following three guarantees: consistency, availability, and partition tolerance.
- Collision.
- Fork. See partitioned state -- FIX
- Leader. The single validator that is currently scheduled to order user messages and produce blocks for the duration of a slot.
- Ledger. The blockchain; a history of blocks stored to disk on a node.
- Message. A message or transaction sent to the leader
- Node. A computer with client software that performs actions like validating, verifying, maintaining the current state, and some or all of the ledger.
- Partitioned state. A condition where the system is diverging from consensus, there are multiple leaders, and general disagreement between validators regarding the "true" state of the network. This can be described as a fork.
- PoH. Proof of History
- PoRep. Proof of replication
- PoS. Proof of History
- RPC. A non-validating node with a copy of the ledger that receives user messages, and forwards to the leader. The node may also serve state and historical information to users via API calls to it--acting as a remote procedure call (RPC) server. 
- Slot. A finite duration of time for a single validator to generate blocks (~200ms?)
- State. The current condition of all of the accounts on the Solana network, stored in RAM on the nodes.
- Signature. A cryptographically-generated hash (string of base-58-encoded characters) representing information that is signed by a private key.   
- Validator. A node that stakes tokens, participates in consensus for validation (as a leader), and verification (voting).
- Verifier. Non-leader nodes that receive published transactions from the leader, execute the transactions on their own copies of the state, and publish their computed signatures as confirmations.
- Vote. The signatures computed from verifiers, or published confirmations from non-leader validators. 
```