/**
 *  @author Willard
 *  @description
 *  Register a vehicle for whitelist tracking
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

if((isNull _vehicle) or (_whitelist == 0) or ((count _slots) == 0)) exitWith {
    ["checkWhitelist either called with null vehilce, no whitelistId or 
        no slot array!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// get whitelist config
_vehicle setVariable ["tf47_core_whitelistId", _whitelist, true];
_vehicle setVariable ["tf47_core_whitelistSlots", _slots, true];

// check whitelist on GetIn/SeatSwitched
_vehicle addEventHandler["GetIn",
    { _this call tf47_core_whitelist_fnc_checkWhitelist; }];
_vehicle addEventHandler["SeatSwitched", {

    _vehicleRole = ((assignedVehicleRole (_this select 1)) select 0);
    if(_vehicleRole == "Turret") then {
        _vehicleRole = "gunner";
    };
    [_this select 0, _vehicleRole, _this select 1, [], false]
        call tf47_core_whitelist_fnc_checkWhitelist;
}];