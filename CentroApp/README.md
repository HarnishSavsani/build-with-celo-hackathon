<h1 align="center">
  <img src="https://user-images.githubusercontent.com/68416821/199021333-ba6a2781-30ca-4d14-91b9-30221d94c761.png" width="32" alt="Logo">
  Build With Celo Hackathon
  <img src="https://user-images.githubusercontent.com/68416821/199021333-ba6a2781-30ca-4d14-91b9-30221d94c761.png" width="32" alt="Logo">
</h1>
A virtual hackathon that invites values-aligned founders and builders worldwide to design and, ultimately, ship their best ideas on the Celo carbon-negative, open source, mobile-first blockchain. Millions of people currently benefit from assets and applications built on Celo, and with this hackathon, Celo is primed to help many more.

<h1 align="center">
  <img src="https://user-images.githubusercontent.com/68416821/199021333-ba6a2781-30ca-4d14-91b9-30221d94c761.png" width="32" alt="Logo">
  Centro - Celo DeFi Center
  <img src="https://user-images.githubusercontent.com/68416821/199021333-ba6a2781-30ca-4d14-91b9-30221d94c761.png" width="32" alt="Logo">
</h1>
Centro will be an  Android, iOS, and web app that allows Celo users to easily access DeFi protocols and manage their assets. Centro will have a simple and standardized user interface, making it easy for novices to engage with dapps on Celo. <br> <br>Centro will empower users to safely and efficiently manage their assets across the Celo ecosystem while maintaining self-custody. Centro will have free cash-in, cash-out, and trading, but we take a small percentage of interest earned on Moola deposits to fund new integrations.
<p align="center" >
  <br>
  <img src="https://user-images.githubusercontent.com/68416821/199023123-64815d48-864d-4fd2-9f72-247f2852dd0e.png" alt="Banner">
</p>

## Team Info
**Team Name** : Hack Elite<br>
**Team Leader** : Harnish Savsani (Full Stack Developer)<br>
**Team Members** : 1<br>
**Theme** : Decentralized Finance (DeFi)<br>
**Location** : Maharashtra, India


## Integrations
- Valora - connect Centro to your Valora wallet
- Moola Market - UI design, connectors, and front-end (deposit)
- Celo Mento - UI design, connectors
- Ubeswap - UI design
- Payments - UI design, connectors
- Block Explorer - fully integrated via in-app browser
- Savings Circles - UI design and smart contracts (funds are automatically invested in Moola and earn interest!)
- impactMarket - beneficiary address in wrapper
- Mobile Money Cashout - developer account setup; sandbox testing complete

## Technical Overview
The Centro app is comprised of four main components: a wallet wrapper, protocol connectors, Celo DappKit, and the React Native front-end.

**Wallet Wrapper**<br>
The wallet wrapper is a smart contract that manages user funds and is only accessible by who created the individual wallet. Using this wrapper, we are able to expand the functionality of a traditional Celo wallet by enabling beneficiary addresses and autonomous transactions.

**Protocol Connectors**<br>
Our protocol connectors allow the Centro front-end to interact with dapps on Celo. The beauty of our wallet wrapper + protocol connectors is that new functionality can be added (new connectors can be made) without having to update each wallet individually.

**Celo DappKit**<br>
DappKit is a library made by Celo to help dapps interface with wallets. We used DappKit to allow users to connect their Valora wallet to Centro.

**React Native**<br>
The Centro front-end was made using React Native + Expo.

## Demonstration
[![Centro Demo](https://user-images.githubusercontent.com/68416821/199027459-4fe37cec-66d1-459c-93c1-76cbe5eb2402.png)](https://youtu.be/Fio48bIlE_4)


## Global Impact
I am are extremely excited about Centro's potential for impact, particularly when it comes to the flow of compounded interest. Using our wallet wrapper and impactMarket APIs, we are able to syphon a percentage of interest earned on Moola deposits to UBI beneficiaries around the world! Similarly, users can redirect interest earned to carbon offsetting initiatives, such Project Wren or MOSS Carbon Credits.

An additional area for impact is where we focus our attention for cash-in/cash-out. While most projects attempt to integrate USD on-/off-ramps, we have focused our attention on mobile-money, the financial fabric of Africa. Specifically, we are integrating the MTN MoMo API, one of the largest mobile money providers in all of Africa. By doing so, we will empower anyone with a smartphone to access Celo services, even if they do not have a bank account.

Furthermore, we are developing custom smart contracts for impact-specific use cases, such as savings circles and village banking. By providing their traditional financial systems on Centro, we not only emulate but improve their activity by making it safer, more efficient, transparent, global, and near-free. We have already created a UI design for a full-fledged village banking system, and have written the smart contracts for savings circles. What makes this application unique is that circle funds are automatically deposited to Moola market so groups can earn interest on stable-value assets. They can either put this interest in a vault, lottery it off, or distribute it back to the members. We are working to finish the react native front-end ASAP.

## What's Next?
- Finish full integrations of Moola, Ubeswap, Mento, and Payments
- Implement savings circles / village banking, impactMarket, and carbon offsetting
- Add beneficiary functionality
- Run live tests with the MTN MoMo API and integrate it
- Create a subgraph on The Graph for integrated analytics

## Important Links
**Presentation** : [https://shorturl.at/rANRV](https://shorturl.at/rANRV)<br>
**Video** : [https://youtu.be/Fio48bIlE_4](https://youtu.be/Fio48bIlE_4)

