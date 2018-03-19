/**
 *  @author Willard
 *  @description
 *  Applys the service to a vehicle
 *  @params 
 *      param 0: The vehicle <object> (required)
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["applyService called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

disableSerialization;

// get the diaglog
_dialog = uiNamespace getVariable ["tf47_modules_sp_main_dialog_var", objNull];
if(isNull _dialog) exitWith {
    ["Dialog not found in applyService.sqf", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// determine which service should be applied
_respawn = cbChecked (_dialog displayCtrl 2805);
_repair = cbChecked (_dialog displayCtrl 2800);
_refuel = cbChecked (_dialog displayCtrl 2801);
_rearm = cbChecked (_dialog displayCtrl 2802);
_clearInv = cbChecked (_dialog displayCtrl 2803);
_clearAceInv = cbChecked (_dialog displayCtrl 2804);

// if nothing is select or vehicle already in service, exit
_anyService = _respawn || _repair || _refuel || _rearm || _clearInv ||
    _clearAceInv;
if(!_anyService || (_vehicle getVariable ["tf47_modules_sp_inService", false]))
    exitWith {};

// in server
_vehicle setVariable ["tf47_modules_sp_inService", true, true];
_initialFuel = fuel _vehicle;
_vehicle setFuel 0;
ctrlSetText [1024, "In Service"];

// respawn
if(_respawn) exitWith {
    closeDialog 0;
    ["tf47_modules_sp_respawn",
        ["Dieses Fahrzeug wird in 10 Sekunden despawnen"]] call
        BIS_fnc_showNotification;
    [_vehicle] remoteExec ["tf47_modules_servicepoint_fnc_despawnVehicle", 2]; 
};

_damage = 0;
_fuel = 0;

_tickTime = 1;

_time = 0;

// repair
if(_repair) then {
    _damage = (damage _vehicle);
    _time = _tickTime * _damage;
    for "_i" from 0 to 100 do {
        if((_i mod 25) == 0) then {
            systemChat format["TF47 Service Point | Schaden: %1%2 fertig", _i,
                "%"];
        };
        sleep _time;
    };
    _vehicle setDamage 0;
    ctrlSetText [1007, format["%1%2", floor (([_vehicle] call
        tf47_modules_servicepoint_fnc_getDamage) * 100), "%"]];
};

// rearm
if(_rearm) then {
    _ammo = [_vehicle] call tf47_modules_servicepoint_fnc_getAmmo;
    _time = _tickTime * _ammo;
    for "_i" from 0 to 100 do {
        if((_i mod 25) == 0) then {
            systemChat format["TF47 Service Point | Munition: %1%2 fertig",
                _i, "%"];
        };
        sleep _time;
    };
    [_vehicle] call tf47_modules_servicepoint_fnc_rearmVehicle;

    _ammo = [_vehicle] call tf47_modules_servicepoint_fnc_getAmmo;
    if(_ammo == -1) then {
        _ammo = "n/a";
    } else {
        _ammo = format["%1%2", floor (_ammo * 100), "%"];
    };
    ctrlSetText [1010, _ammo];
};

// refuel
if(_refuel) then {
    _fuel = (_initialFuel - 1)* -1;
    _time =  _tickTime * _fuel;
    for "_i" from 0 to 100 do {
        if((_i mod 25) == 0) then {
            systemChat format["TF47 Service Point | Treibstoff: %1%2 fertig",
                _i, "%"];
        };
        sleep _time;
    };
    _initialFuel = 1;
    ctrlSetText [1008, format["%1%2", floor ((fuel _vehicle) * 100), "%"]];
};
_vehicle setFuel _initialFuel;

// clear van inf
if(_clearInv) then {
    clearBackpackCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    ctrlSetText [1011, format["100%1", "%"]];
    systemChat format["TF47 Service Point | Inventar geleert"];
};

// clear ace inf
if(_clearAceInv) then {
    {
        [_x, _vehicle] call ace_cargo_fnc_removeCargoItem;
    } forEach (_vehicle getVariable["ace_cargo_loaded", []]);
    ctrlSetText [1016, format["100%1", "%"]];
    systemChat format["TF47 Service Point | ACE Inventar geleert"];
};

// not longer in service
_vehicle setVariable ["tf47_modules_sp_inService", false, true];
ctrlSetText [1024, "       Bereit"];
