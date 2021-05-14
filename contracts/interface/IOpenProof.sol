pragma solidity >=0.7.0 <0.9.0;

import "./IOpenParameters.sol"

interface IOpenProof is IOpenParameters { 
    
    function getProofConfiguration() external view returns (address _author, uint256 _issueDate);
    
} 