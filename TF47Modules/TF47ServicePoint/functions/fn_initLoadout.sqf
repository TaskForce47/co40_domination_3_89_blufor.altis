/**
 *  @author Willard
 *  @description
 *  Inits the loadout dialog
 *  @params none
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];
if(_vehicle == player || isNull _vehicle) exitWith {
    ["You are not in a valid vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

ctrlEnable [1604, false];
[] call tf47_modules_servicepoint_fnc_initVanillaLoadouts;

_aceCargo = [_vehicle] call tf47_modules_servicepoint_fnc_getAceCargo;

if(_aceCargo == -1) then {
	ctrlShow [1604, false];
	ctrlShow [1605, false];
};