/**
 *  @author Willard
 *  @description
 *  Inits the main dialog
 *  @params none
 *  @return nothing
 */
_vehicle = player getVariable["tf47_modules_sp_vehicle", player];
if(_vehicle == player) exitWith {
    ["You are not in a vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

waitUntil {(ctrlText 1001) != ""};
disableSerialization;

// get the dialog
_control = uiNamespace getVariable ['tf47_modules_sp_main_dialog_var',nil];

// determine service state
if(_vehicle getVariable ["tf47_modules_sp_inService", false]) then {
    ctrlSetText [1024, "In Service"];
} else {
    ctrlSetText [1024, "       Bereit"];
};

// set vehicle picture and text
ctrlSetText [1200, getText(configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "picture")];

ctrlSetText [1002, getText(configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "displayName")];

// Get the ammo and show it
_ammo = [_vehicle] call tf47_modules_servicepoint_fnc_getAmmo;
if(_ammo == -1) then {
    _ammo = "n/a";
} else {
    _ammo = format["%1%2", floor (_ammo * 100), "%"];
};

// get the free inventory space
_usedLoad = [_vehicle] call
    tf47_modules_servicepoint_fnc_getFreeVanillaInventory;
_maxLoad = getNumber (configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "maximumLoad");
if(_maxLoad == 0) then {
    _maxLoad = 1;
    _usedLoad = 1;
};
// get the free ace cargo space and show it
_aceCargo = [_vehicle] call tf47_modules_servicepoint_fnc_getAceCargo;
if(_aceCargo == -1) then {
    _aceCargo = "n/a";
    ctrlEnable [2804, false];
    (_control displayCtrl 1021) ctrlSetTextColor [0.3,0.3,0.3,1];
} else {
    _aceCargo = format["%1%2", floor (_aceCargo * 100), "%"];
};

// show damage, fuel, ammo and inventroy/cargo space
ctrlSetText [1007, format["%1%2", floor (([_vehicle] call
    tf47_modules_servicepoint_fnc_getDamage) * 100), "%"]];
ctrlSetText [1008, format["%1%2", floor ((fuel _vehicle) * 100), "%"]];
ctrlSetText [1010, _ammo];
ctrlSetText [1011, format["%1%2", floor ((_usedLoad / _maxLoad) * -100 + 100),
    "%"]];
ctrlSetText [1016, _aceCargo];

if((count (_vehicle getCompatiblePylonMagazines 0) <= 0) && 
    (count ((tf47_modules_sp_ammo_tankAmmo select 0) 
        select {_vehicle isKindOf _x}) < 1)
    ) then {
    ctrlEnable [1601, false];
    /*
    if(count ((tf47_modules_sp_ammo_tankAmmo select 0) 
        select {_vehicle isKindOf _x}) < 1) then {
        ctrlEnable [2802, false];
        (_control displayCtrl 1019) ctrlSetTextColor [0.3,0.3,0.3,1];
    };
    */
}; /*else {
    ctrlEnable [2802, false];
    (_control displayCtrl 1019) ctrlSetTextColor [0.3,0.3,0.3,1];
};*/