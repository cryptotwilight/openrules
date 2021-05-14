pragma solidity >=0.7.0 <0.9.0;
    
    
interface IORTypedParameters { 
    
    function getParameters() external view returns (string [] memory parameterNames); 
    
    function getParameterTypes() external view returns (string [] memory _parameterName, string [] memory _type);
    
    function getParameterType(string memory _type) external view returns (string memory _type);
}