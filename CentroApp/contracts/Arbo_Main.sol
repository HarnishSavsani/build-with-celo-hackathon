pragma solidity >0.5.0;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "./registry/Storage.sol";
import "./registry/Types.sol";
import "./Connectors/MoolaC.sol";
import "./registry/ArboWallet.sol";

contract CentroMain is ReentrancyGuard, Types{
    mapping(address => uint256) currentWallet;
    Storage store = Storage(0x0000000);

    function newWallet(String memory name) external {
        ArboWallet wallet_addr = new ArboWallet(msg.sender);
        Wallet memory wallet;
        wallet.name = name;
        wallet.owner = msg.sender;
        wallet.role = "Owner";
        wallet.addr = address(wallet_addr);
        wallet.id = store.getNumWallets() + 1;
        store.addWallet(msg.sender, wallet);
        currentWallet[msg.sender] = wallet.id;
    }

    function getAccountIds() view returns (uint256[] memory) {
        return (store.retrieveIds(msg.sender));
    }

    function persistWallet(uint256 _id) {
        Wallet _w = store.getWallet(_id);
        require (_w.owner == msg.sender, "User is not authorized for the given id");
        currentWallet[msg.sender] = _id;
    } 

    function getWallet(uint256 _wId) internal view returns (SmartWallet) {
        uint256 wId = _wId == 0 ? currentWallet[msg.sender].id : _wId;
        require(wId != 0, "Provide a wallet id, or persist a wallet.");
        Wallet storage w = store.getWallet(wId);
        return(SmartWallet(w.addr));
    }

    function getAccountOverview() view returns (Wallet[] memory _wallets) {
        uint256[] memory IDs = store.retrieveIds(msg.sender);
        Wallet[] memory _wallets = new Wallet[](IDs.length);
        for (uint256 i = 0; i < IDs.length; i++) {
            _wallets[i] = store.getWallet(IDs[i]);
        }
    }

    function getWalletBalance(uint256 _wId) view returns (address[] memory tokens, uint256[] memory balances) {
        SmartWallet memory sw = getWallet(_wId);
        return sw.getBasis(msg.sender);
    }

    function deposit(address _tok, uint256 _amt, uint256 _wId) external payable {
        SmartWallet memory sw = getWallet(_wId);
        sw.deposit(msg.sender, _tok, _amt);
    }

    function moolaDeposit(address _tok, uint256 _amt, uint256 _wId) payable {
        SmartWallet memory sw = getWallet(_wId);
        bytes memory data = abi.encodeWithSignature("deposit(address, uint256)", _tok, _amt);
        sw.callConnector(msg.sender, store.getConnector("moola"), data);
    }

    function withdraw(address _tok, uint256 _amt, uint256 _wId) external payable {
        SmartWallet memory sw = getWallet(_wId);
        sw.withdraw(msg.sender, _tok, _amt);
    }

    function moolaWithdraw(address _tok, uint256 _amt, uint256 _wId) payable {
        SmartWallet memory sw = getWallet(_wId);
        bytes memory data = abi.encodeWithSignature("withdraw(address, uint256)", _tok, _amt);
        sw.callConnector(msg.sender, store.getConnector("moola"), data);
    }

    function buyCelo(uint256 _amt, uint256 _maxSellAmt, uint256 _wId) external {
        SmartWallet memory sw = getWallet(_wId);
        bytes memory data = abi.encodeWithSignature("buyCelo(uint256, uint256)", _amt, _maxSellAmt);
        sw.callConnector(msg.sender, store.getConnector("exchange"), data);
    }

    function sellCelo(uint256 _amt, uint256 _minBuyAmt, uint256 _wId) external {
        SmartWallet memory sw = getWallet(_wId);
        bytes memory data = abi.encodeWithSignature("sellCelo(uint256, uint256)", _amt, _minBuyAmt);
        sw.callConnector(msg.sender, store.getConnector("exchange"), data);
    }

    function send(address _tok, uint256 _receiver, uint256 _amt, uint256 _wId) payable external {
        SmartWallet memory from = getWallet(_wId);
        SmartWallet memory to = getWallet(_wId);
        from.send(msg.sender, _tok, address(to), _amt);
        to.incrementBasis(_tok, _amt);
    }

    function callConnector(String memory _connector, bytes _calldata, uint256 _wId) external {
        address target = store.getConnector(_connector);
        require(target != address(0), "Not a valid connector name");
        SmartWallet sw = getWallet(_wId);
        sw.callConnector(target, _calldata);
    }
    
}