/**
 *  @author Willard
 *  @description
 *  Check if the player is whitelisted for his current vehicle
 *  @params 
 *      param 0: The vehicle <object> (required)
 *      param 1: The position of the player <string> (required)
 *      param 2: The player <object> (required)
 *      param 3: The turret path <array<string>>
 *      param 4: print succes message <boolean>
 *  @returns nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_postion", "", [""]],
    ["_unit", objNull, [objNull]],
    ["_turretPath", [], [[]]],
    ["_successMessage", true, [true]]
];

if(!isServer) exitWith {
    ["checkWhitelist not called on the server!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if((isNull _vehicle) or (_postion == "") or (isNull _unit)) exitWith {
    ["checkWhitelist called either called with a null vehicle, 
        an empty positon or a null unit!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if(!(_unit isKindOf "Man")) exitWith {
    ["checkWhitelist called without a valid player!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// no whitelist for "cargo"
if(!(_postion in ["driver", "gunner", "commander"])) exitWith {};

// get whitelist config
_whitelistId = _vehicle getVariable ["tf47_core_whitelistId", 0];
_whitelistSlots = _vehicle getVariable ["tf47_core_whitelistSlots", []];

// determine player id
_playerId = getPlayerUID _unit;

// in sp we use Willard's player id
if(_playerId == "_SP_PLAYER_") then {
    _playerId = "76561198022749433";
};

// build query to check if the player is on the required whitelist
_queryResult = "extDB3" callExtension format["0:SQL:checkWhitelist:%1:%2", _playerId, _whitelistId];

_resultArray = ((call compileFinal _queryResult) select 1);

// determine notification
_whitelistName = switch (_whitelistId) do {
    case 1: { "air" };
    case 2: { "tank" };
    case 3: { "cct" };
    default { "" };
};

_failNotification = format["tf47_core_%1Fail", _whitelistName];

// if he isn't on the whitelist, kick him out
if((count _resultArray) == 0) exitWith {
    _unit action ["GetOut", _vehicle];
    [_failNotification, ["Du befindest dich nicht auf der Whitelist!"]] 
        remoteExecCall ["BIS_fnc_showNotification", owner _unit];
};

// if he isn't in the correct slot, kick him out
if(!((str _unit) in _whitelistSlots)) exitWith {
    _unit action ["GetOut", _vehicle];
    [_failNotification, ["Du bist im falschen Slot für dieses Fahrzeug!"]] 
        remoteExecCall ["BIS_fnc_showNotification", owner _unit];
};

// show success message
if(_successMessage) then {
    [format["tf47_core_%1Success", _whitelistName], ["Überprüfung erfolgreich!"]] 
        remoteExecCall ["BIS_fnc_showNotification", owner _unit];
};
