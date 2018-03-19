/**
 *  @author Willard
 *  @description
 *  Adds an ACE Loadout to a vehicle
 *  @params 
 *      param 0: The vehicle <object> (required)
 *      param 1: The <ARRAY> (required)
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_loadout", [], [[]]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["applyAceLoadout called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// check for empty array
if((count _loadout) == 0) exitWith {
    ["applyAceLoadout called without a valid loadout", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if(_vehicle == player) exitWith {
    ["You are not in a valid vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// clear the ace cargo
if(!(_loadout select 1)) then {
    _vehicle setVariable ["ace_cargo_loaded", [], true];
    _vehicle setVariable ["ace_cargo_space", getNumber (configFile >>
        "CfgVehicles" >> typeOf _vehicle >> "ace_cargo_space"), true];
};

// add the cargo
for "_i" from 2 to ((count _loadout) - 1) do {
    for "_k" from 0 to ((_loadout select _i) select 1) do {
        if([(_loadout select _i) select 0, _vehicle] call
            ace_cargo_fnc_canLoadItemIn) then {
            _loadedItem = [(_loadout select _i) select 0, _vehicle] call
                ace_cargo_fnc_addCargoItem;
        } else {
            hint "Nicht genügend freier Platz vorhanden!";
        };
    };
};

// done message
systemChat format['TF47 Service Point | Loadout "%1" wurde hinzugefügt!',
    _loadout select 0];
