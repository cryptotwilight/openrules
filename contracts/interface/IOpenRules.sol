pragma solidity >=0.7.0 <0.9.0;


interface IOpenRules { 
    
    function getRulesConfiguration() external view returns (address _author, uint256 _version, uint256 _issueDate, uint256 _contestWindow, uint256 issuedVerdictCount, uint256 contestedVerdictCount);
    
    function getRulesDescription () external view returns (string memory _textDescription);
    
    
    function issueVerdict(address _case, address _proof) payable external returns (address _verdict);
    
    function getHistoricalVerdict(address _case)  payable external returns (address _verdict);
    
    function contestVerdict(address _verdict, address _contestProof) payable external returns (address _finalVerdict);
    
    
    function getParameterConditionString(string memory _parameterName) override external returns (string [] memory _condition, string [] memory _value, uint256 _penaltyPercentage);
    
    function getParamterConditionBool (string memory _parameterName) override external returns (string [] memory _condition, bool [] memory _value, uint256 _penaltyPercentage);
    
    function getParameterConditionUint (string memory _parameterName) override external returns (string [] memory _condition, uint256 [] memory _value, uint256 _penaltyPercentage);
    
}
