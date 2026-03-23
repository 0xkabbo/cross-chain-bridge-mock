# Cross-Chain Bridge Mock

A professional-grade structural template for building blockchain bridges. This repository focuses on the core smart contract logic required to facilitate asset transfers between two independent chains (e.g., Ethereum and Polygon).

## Core Mechanisms
* **Bridge Source (Lock):** Users lock native/ERC-20 assets on the source chain. An off-chain relayer detects this event.
* **Bridge Destination (Mint):** A corresponding "Wrapped" asset is minted on the destination chain for the user.
* **Security Logic:** Implements validator signatures and threshold checks to prevent unauthorized minting.
* **Flat Structure:** All necessary bridge components are contained in the root directory for clarity.

## Implementation Details
1. **SourceBridge.sol:** Handles the `lock` and `unlock` logic.
2. **DestinationBridge.sol:** Handles the `mint` and `burn` logic.
3. **MockToken.sol:** A standard ERC-20 for testing the transfer flow.

## Setup
1. `npm install`
2. Deploy `SourceBridge` on Network A and `DestinationBridge` on Network B.
3. Use `bridge-test.js` to simulate a cross-chain transfer.
