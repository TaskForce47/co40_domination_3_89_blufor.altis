/**
 *  @author Willard
 *  @description
 *  Applys a vanilla loadout
 *  @params 
 *      param 0: The vehicle <object> (required)
 *      param 1: The loadout <ARRAY> (required)
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_loadout", [], [[]]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["applyVanillaLoadout called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// check for empty array
if((count _loadout) == 0) exitWith {
    ["applyVanillaLoadout called without a valid loadout", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if(_vehicle == player) exitWith {
    ["You are not in a valid vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// if no module, clear inventory
if(!(_loadout select 1)) then {
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
};

// determine remaing load
_maxLoad = getNumber (configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "maximumLoad");

_freeLoad = [_vehicle] call
    tf47_modules_servicepoint_fnc_getFreeVanillaInventory;

_remainingLoad = _maxLoad - _freeLoad;

// check if loadout can be applied
for "_i" from 2 to ((count _loadout) - 1) do {
    _remainingLoad = _remainingLoad - (((_loadout select _i) select 1) *
        ([((_loadout select _i) select 0), ((_loadout select _i) select 2)]
            call tf47_modules_servicepoint_fnc_getMass));
};

if(_remainingLoad <= 0) exitWith {
    hint "Nicht genügend freier Platz vorhanden!";
};

// add items until full or done
for "_i" from 2 to ((count _loadout) - 1) do {
    if(((_loadout select _i) select 2) == "CfgVehicles") then {
        _vehicle addBackpackCargoGlobal [(_loadout select _i) select 0,
            (_loadout select _i) select 1];
    } else {
        _vehicle addItemCargoGlobal [(_loadout select _i) select 0,
            (_loadout select _i) select 1];
    };
};

systemChat format['TF47 Service Point | Loadout "%1" wurde hinzugefügt!',
    _loadout select 0];
