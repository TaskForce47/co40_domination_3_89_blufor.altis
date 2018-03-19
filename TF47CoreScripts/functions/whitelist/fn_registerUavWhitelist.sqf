/**
 *  @author Willard
 *  @description
 *  Register a uav for whitelist tracking
 *  @params 
 *      param 0: The vehicle <object> (required)
 *      param 1: The whitelist id <number> (required)
 *      param 2: The whitelist slots <array<string>> (required)
 *  @returns nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_whitelist", 0, [0]],
    ["_slots", [], [[]]]
];

if(!isServer) exitWith {
    ["registerWhitelist not called on the server!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if((isNull _vehicle) or (_whitelist == 0)) exitWith {
    ["checkWhitelist either called with null vehilce, no whitelistId or 
        no slot array!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

tf47_core_whitelist_uavWhitelist pushBack [_vehicle, _whitelist, _slots];
publicVariable "tf47_core_whitelist_uavWhitelist";

//[_vehicle, ]