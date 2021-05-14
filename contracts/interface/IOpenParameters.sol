pragma solidity >=0.7.0 <0.9.0;

import "./IORTypedParameters.sol";

interface IOpenParameters is IORTypedParameters{ 
    
    function getParameterString(string memory _parameterName) view external returns (string memory _value);
    
    function getParamterBool (string memory _parameterName) view external returns ( bool memory _value);
    
    function getParameterUint (string memory _parameterName) view external returns (uint256 memory _value);
}