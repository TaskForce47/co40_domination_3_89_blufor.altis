/**
 *  @author Willard
 *  @description
 *  Check if the player is whitelisted for his current vehicle
 *  @params 
 *      param 0: The player <object> (required)
 *      param 1: The vehicle/uav <object> (required)
 *      param 2: print succes message <boolean>
 *  @returns nothing
 */
_result = _this params [
    ["_unit", object, [objNull]],
    ["_vehicle", objNull, [objNull]],
    ["_successMessage", true, [true]]
];

if(!isServer) exitWith {
    ["checkWhitelistUav not called on the server!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if((isNull _vehicle) or (isNull _unit)) exitWith {
    ["checkWhitelist called either called with a null vehicle, 
        or a null unit!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if(!(_unit isKindOf "Man")) exitWith {
    ["checkWhitelist called without a valid player!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if(_whitelistId == 0) exitWith {};


_index = -1;
{
    if(_vehicle == (_x select 0)) exitWith {
        _index = _forEachIndex;
    };
} forEach tf47_core_whitelist_uavWhitelist;

if(_index == -1) exitWith {};

// determine player id
_playerId = getPlayerUID _unit;

_whitelistId = (tf47_core_whitelist_uavWhitelist select _index) select 1;
_whitelistSlots = (tf47_core_whitelist_uavWhitelist select _index) select 2;

// in sp we use Willard's player id
if(_playerId == "_SP_PLAYER_") then {
    _playerId = "76561198022749433";
};

// build query to check if the player is on the required whitelist
_queryResult = "extDB3" callExtension format["0:SQL:checkWhitelist:%1:%2", 
    _playerId, _whitelistId];

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
    _unit connectTerminalToUAV objNull;
    [_unit, [_vehicle, true]] remoteExecCall ["disableUAVConnectability", _unit];
    [_failNotification, ["Du befindest dich nicht auf der Whitelist!"]] 
        remoteExecCall ["BIS_fnc_showNotification", owner _unit];
};

// if he isn't in the correct slot, kick him out
if((!((str _unit) in _whitelistSlots)) and ((count _whitelistSlots) != 0)) 
    exitWith {
    _unit connectTerminalToUAV objNull;
    [_unit, [_vehicle, true]] remoteExecCall ["disableUAVConnectability", _unit];
    [_failNotification, ["Du bist im falschen Slot für dieses Fahrzeug!"]] 
        remoteExecCall ["BIS_fnc_showNotification", owner _unit];
};

// show success message
if(_successMessage) then {
    [format["tf47_core_%1Success", _whitelistName], ["Überprüfung erfolgreich!"]] 
        remoteExecCall ["BIS_fnc_showNotification", owner _unit];
};
