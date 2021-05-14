pragma solidity >=0.7.0 <0.9.0;

contract OpenProof is  ORTYP, IOpenProof { 

    address author; 
    uint256 issueDate; 

    constructor(address _author, uint256 _issueDate) {
        author = _author; 
        issueDate = _issueDate; 
    }
    
    function getProofConfiguration() external view returns (address _author, uint256 _issueDate){
        return (author, issueDate);
    }

} 