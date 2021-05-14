pragma solidity >=0.7.0 <0.9.0;


contract ORTYP is IORTypedParameters{
    
    mapping(string=>string) parameterTypesByName; 

    mapping(string=>uint256) numberByParameter; 
    mapping(uint256=>string) parameterByNumber; 
    mapping(string=>bool) knownParameter; 
 
    uint256 parameterCount; 
    
    bool isParametersLocked;

    function getParameters() override external returns (string [] memory parameterNames){
        string [] memory parameterNames = string[](parameterCount);
        uint256 index = 0;
        for(uint256 x = 1; x <= parameterCount; x++){
            string parameter = numberByParameter[x];
            if(knownParameter[parameter]) {
                parameterNames[index] = parameter; 
                index++;
            }
        }
        return parameterNames; 
    }
    
    function getParameterTypes() override external returns (string [] memory _parameterNames, string [] memory _types){
        string [] memory parameterNames = string[](parameterCount);
        string [] memory parameterTypes = string[](parameterCount);
        uint256 index = 0;
        for(uint256 x = 1; x <= parameterCount; x++){
            string parameter = numberByParameter[x];
            if(knownParameter[parameter]) {
                parameterNames[index] = parameter; 
                parameterTypes[index] = parameterTypesByName[parameter];
                index++;
            }
        }
        return (parameterNames, parameterTypes);
    }

    function getParameterType(string memory _parameterName) override external returns (string memory _type){
        require(knownParameter[_parameterName], "gpt 00 - unknown parameter");
        return parameterTypesByName[_parameterName];
    }
    
    function addParameter(string memory _parameterName, string memory _parameterType) external returns (bool _added {
        require(!isParametersLocked, "ap 00 - parameters are locked");
        parameterTypesByName[_parameterName] = _parameterType; 
        parameterCount++;
        uint256 id = _parameterCount;
        parameterByNumber[id] = _parameterName;
        numberByParameter[_parameterName] = id; 
        knownParameter[_parameterName] = true; 
    }
    
    function removeParameter(string memory _parameterName) external returns (bool _removed) {
        require(!isParametersLocked, "rp 00 - parameters are locked");
        knownParameter[_parameterName] = false; 
        parameterCount--;
    }

    function lockParameters() external returns (bool _locked) {
        isParametersLocked = true; 
        return isParametersLocked; 
    }

}
