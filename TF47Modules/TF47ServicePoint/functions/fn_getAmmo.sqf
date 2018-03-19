/**
 *  @author Willard
 *  @description
 *  Gets the current ammo in percent
 *  @params 
 *      param 0: The vehicle <object> (required)
 *  @return Current ammo in percent
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {
    ["getAmmo called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// get magazine count
_allMagazines = magazinesAllTurrets _vehicle;
_magazineCount = count _allMagazines;

// sum magazine count
_ammoPercentSum = 0;
{
    _ammoPercentSum = _ammoPercentSum + ((_x select 2) / getNumber
        (configFile >> "CfgMagazines" >> (_x select 0) >> "count"));
} forEach _allMagazines;

// calculate percentage
if(_magazineCount == 0) exitWith {
    _ammoPercentSum = -1;
    _ammoPercentSum
};
_ammoPercentSum = _ammoPercentSum / _magazineCount;

_ammoPercentSum