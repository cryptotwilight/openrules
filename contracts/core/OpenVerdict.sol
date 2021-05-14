pragma solidity >=0.7.0 <0.9.0;


contract OpenVerdict is IOpenVerdict { 
    
    address rulesAddress; 
    address proofAddress; 
    address contestProofAddress; 
    mapping(address=>uint256) awardAmountByPartyAddress;
    mapping(address=>address) awardERC20ContractByPartyAddress; 
    
    bool isSealed;
    string status = "open"; 
    
    constructor(address _openRulesAddress, address _openProof, address _openContestProof ) {
        rulesAddress = _openRulesAddress; 
        proofAddress = _openRulesProofAddress; 
        contestProofAddress = _openRulesContestProof;
    }
    
    function getAward(address _party) override external view (uint256 _amount, address _erc20Contract){
        return (awardAmountByPartyAddress[_party], awardERC20ContractByPartyAddress[_erc20Contract]);
    }
    
    function getRules() override external view (address _openRules){
        return rulesAddress; 
    }
    
    function getProof() override  external view (address _openProof){
        return proofAddress; 
    }
    
    function getContestProof() override external view (address _openProof){
        return contestProofAddress; 
    }
    
    function addAward(address _partyAddress, address _erc20Contract, uint256 _awardAmount) external returns (bool _added){
        require(!isSealed, "aa 00 - verdict is sealed");
        require(msg.sender == rulesAddress, "aa 00 - open rules only");
        
        awardAmountByPartyAddress[_partyAddress, _awardAmount];
        awardERC20ContractByPartyAddress[_partyAddress, _erc20Contract];
        
        return true; 
    }
    
    function getStatus() external view returns(string memory _status) {
        return status; 
    }
    
    function sealVerdict() external returns (bool _sealed) {
        isSealed = true; 
        status = "sealed";
        return isSealed; 
    }
}