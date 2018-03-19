/**
 *  @author Willard
 *  @description
 *  Rearms a vehicle
 *  @params 
 *      param 0: The vehicle <OBJECT> (required)
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["rearmVehicle called with empty string", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_allMagazines = magazinesAllTurrets _vehicle;
// remove every magazine, then add every magazine again
{
    //_vehicle removeMagazinesTurret [_x select 0, _x select 1];
    [_vehicle, [_x select 0, _x select 1]] remoteExecCall 
        ["removeMagazinesTurret", (_vehicle turretOwner (_x select 1))];
} forEach _allMagazines;
{
    //_vehicle addMagazineTurret [_x select 0, _x select 1];
    [_vehicle, [_x select 0, _x select 1]] remoteExecCall 
        ["addMagazineTurret", (_vehicle turretOwner (_x select 1))];
} forEach _allMagazines;