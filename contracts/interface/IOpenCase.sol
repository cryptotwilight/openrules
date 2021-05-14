pragma solidity >=0.7.0 <0.9.0;


interface IOpenCase is IOpenParameters {
    
    function getParties() external view returns (address [] memory _partyAddresses, string memory _partyRole);

    function getPartyRole(address _party) external view returns (string memory _partyRole);
    
    function getContestedAmount() external view returns (uint256 _amount, address _erc20Address);
    
    function getStatus() external view returns (string memory _caseStatus);
    
}