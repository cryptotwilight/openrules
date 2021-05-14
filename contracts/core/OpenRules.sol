pragma solidity >=0.7.0 <0.9.0;

contract OpenRules is  ORTYP, IOpenRules { 
    
    address author; 
    uint256 version; 
    uint256 issueDate; 
    
    uint256 contestWindow; 
    uint256 issueVerdictCount; 
    uint256 contestedVerdictCount;
    
    string memory description; 
    
    mapping(address=>address) verdictByCase; 

    
    constructor(address _roleManagerAddress, address _bankAddress){ 
       
    }
    
    
    function getRulesConfiguration() external view returns (address _author, uint256 _version, uint256 _issueDate, uint256 _contestWindow, uint256 issuedVerdictCount, uint256 _contestedVerdictCount){
        return (author, version, issueDate, contestWindow, issuedVerdictCount, contestedVerdictCount); 
    }
    
    function getRulesDescription () external view returns (string memory _textDescription){
        return description; 
    }
    
    
    function issueVerdict(address _case, address _proof) payable external returns (address _verdict){
        
    }
    
    function getHistoricalVerdict(address _case)  payable external returns (address _verdict){
        //
        return verdictByCase[_case];
    }
    
    function contestVerdict(address _verdict, address _contestProof) payable external returns (address _finalVerdict){
        
        
    }
    
    
    function getParameterConditionString(string memory _parameterName) override external returns (string [] memory _condition, string [] memory _value, uint256 _penaltyPercentage){
        
    }
    
    function getParamterConditionBool (string memory _parameterName) override external returns (string [] memory _condition, bool [] memory _value, uint256 _penaltyPercentage){
        
    }
    
    function getParameterConditionUint (string memory _parameterName) override external returns (string [] memory _condition, uint256 [] memory _value, uint256 _penaltyPercentage){
        
    }
    
    
} 