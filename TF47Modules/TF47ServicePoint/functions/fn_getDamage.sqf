/**
 *  @author Willard
 *  @description
 *  Gets the current damage of the vehicle in percent
 *  @params 
 *      param 0: The vehicle <object> (required)
 *  @return Current damage of the vehicle in percent
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["getDamage called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// get all hitpoints
_allHitpoints = "true" configClasses
    (configfile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints");

// sum the hitpoint damage
_hitPointCount = 0;
_hitPointDamage = 0;
_wheelCount = 0;
_wheelDamage = 0;
{
    _hitPointName = configName _x;
    if(["wheel", _hitPointName] call BIS_fnc_inString) then {
        _wheelCount = _wheelCount + 1;
        _wheelDamage = _wheelDamage +
            (_vehicle getHitPointDamage _hitPointName);
    } else {
        _hitPointCount = _hitPointCount + 1;
        _hitPointDamage = _hitPointDamage +
            (_vehicle getHitPointDamage _hitPointName);
    };
} forEach _allHitpoints;

// treat wheels as one hitpoint
if(_wheelCount > 0) then {
    _hitPointDamage = _hitPointDamage + (_wheelDamage / _wheelCount);
    _hitPointCount = _hitPointCount + 1;
};

if(_hitPointCount == 0) then { _hitPointCount = 1; };

// calculate percent
_hitPointDamage = _hitPointDamage  / _hitPointCount;

_hitPointDamage
