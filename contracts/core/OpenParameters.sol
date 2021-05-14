pragma solidity >=0.7.0 <0.9.0;

import "./ORTYP.sol";
import "../interface/IOpenParameters.sol";

contract OpenParameters is IOpenParameters, ORTYP {
    
    mapping(string=>string) parameterStringByName; 
    mapping(string=>uint256) parameterUintByName; 
    mapping(string=>bool) parameterBoolByName; 
    
    function getParameterString(string memory _parameterName) view external returns (string memory _value){
        require(knownParameter[_parameterName], "gps 00 - unknown parameter");
        return parameterStringByName[_parameterName];
    }
    
    function getParamterBool (string memory _parameterName) view external returns ( bool memory _value){
        require(knownParameter[_parameterName], "gpb 00 - unknown parameter");
        return parameterBoolByName[_parameterName];
        
    }
    
    function getParameterUint (string memory _parameterName) view external returns (uint256 memory _value){
        require(knownParameter[_parameterName], "gpu 00 - unknown parameter");
        return parameterUintByName[_parameterName];
    }
    
    function setParameterString(string memory _parameterName, string memory _value) returns (uint256 _set){
        require(!isParametersLocked, "sps 00 - parameter are locked");
        if(!knownParameter[_parameterName]) {
            addParameter(_parameterName, "STRING");
        }
        parameterStringByName[_parameterName] = _value; 
        return  true; 
    }
    
    function setParameterBool(string memory _parameterName, bool _value) returns (uint256 _set){
        require(!isParametersLocked, "spb 00 - parameter are locked");
        if(!knownParameter[_parameterName]) {
            addParameter(_parameterName, "BOOL");
        }
        parameterBoolByName[_parameterName] = _value; 
        return true; 
    }
    
    function setParameterUint(string memory _parameterName, uint256 _value) returns (uint256 _set){
        require(!isParametersLocked, "spu 00 - parameter are locked");
        if(!knownParameter[_parameterName]) {
            addParameter(_parameterName, "UINT");
        }
        parameterUintByName[_parameterName] = _value; 
        return true; 
    }
}