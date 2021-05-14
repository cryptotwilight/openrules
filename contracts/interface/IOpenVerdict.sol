pragma solidity >=0.7.0 <0.9.0;


interface IOpenVerdict { 
    
    function getAward(address _party) external view (uint256 _amount, address _erc20Contract);
    
    function getRules() external view (address _openRules);
    
    function getProof() external view (address _openProof);
    
    function getContestProof() external view (address _openProof); 
    
    function getCase() external view (address _openCase);
}