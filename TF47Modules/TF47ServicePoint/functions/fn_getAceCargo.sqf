/**
 *  @author Willard
 *  @description
 *  Gets the used ace cargo size in percent
 *  @params 
 *      param 0: The vehicle <object> (required)
 *  @return Used ace cargo in percent
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["getAceCargo called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// determine current and max cargo
_currentCargo = _vehicle getVariable ["ace_cargo_space", -1];
_maxCargo = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >>
    "ace_cargo_space");

// calculate used ace cargo space in percent
_result = 0;
if(_currentCargo == -1 && _maxCargo == 0) then {
    _result = -1;
} else {
    _result = (_currentCargo / _maxCargo);
};

_result
