/**
 *  @author Willard
 *  @description
 *  Determines the marker type for the given vehicle and side
 *  @params 
 *      param 0: The vehicle <object> (required)
 *      param 1: The vehicles side <side> (required)
 *  @returns the marker type <string>
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_side", west, [west]]
];

if(isNull _vehicle) exitWith {
     ["getMarkerType called with null vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_className = typeOf _vehicle;

// determine side prefix
_markerSide = switch (_side) do {
    case (west): {
        "b_"
    };
    case (east): {
        "o_"
    };
    case (resistance): {
        "n_"
    };
};

// Container
if(_className == "B_Slingload_01_Medevac_F") exitWith {
    "b_med"
};

if(_className == "B_Slingload_01_Ammo_F" ||
    _className == "B_Slingload_01_Repair_F" ||
    _className == "B_Slingload_01_Fuel_F") exitWith {
    "b_maint"
};

if(_className == "B_Slingload_01_Cargo_F") exitWith {
    "b_support"
};

// determine the marker type
_configPath = (configFile >> "CfgVehicles" >> (typeOf _vehicle));

// medical
if(getNumber(_configPath >> "attendant") == 1 ||
    _className == "rhsusf_M1230a1_usarmy_d" ||
    _className == "rhsusf_M1230a1_usarmy_wd" ||
    _className == "rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy" ||
    _className == "rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy"
) exitWith {
    format["%1med", _markerSide];
};

// support
if (
    getNumber (_configPath >> "transportRepair") > 0 ||
    getNumber (_configPath >>  "transportFuel") > 0 ||
    getNumber (_configPath >>  "transportAmmo") > 0 ||
    getNumber (_configPath >>  "ACE_canRepair") > 0 ||
    getNumber (_configPath >>  "ACE_fuelCapacityCargo") > 0 ||
    _className == "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d" ||
    _className == "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd" ||
    _className == "rhsusf_M978A4_BKIT_usarmy_d" ||
    _className == "rhsusf_M978A4_BKIT_usarmy_wd" ||
    _className == "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d" ||
    _className == "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd" ||
    _className == "rhsusf_M977A4_AMMO_BKIT_usarmy_d" ||
    _className == "rhsusf_M977A4_AMMO_BKIT_usarmy_wd" ||
    _className == "rhsusf_M977A4_REPAIR_BKIT_usarmy_wd" ||
    _className == "rhsusf_M977A4_REPAIR_BKIT_usarmy_d"
) exitWith {
    format["%1maint", _markerSide];
};

// plane
if (_vehicle isKindOf "Plane") exitWith {
    format["%1plane", _markerSide];
};

// helicopter
if (_vehicle isKindOf "Air") exitWith {
    format["%1air", _markerSide];
};

// mortar
if (_vehicle isKindOf "StaticMortar") exitWith {
    format["%1mortar", _markerSide];
};

// artillery
if (getNumber (_configPath >> "artilleryScanner") == 1) exitWith {
    format["%1art", _markerSide];
};

// car/motorized infantry
if (_vehicle isKindOf "Car") exitWith {
    format["%1motor_inf", _markerSide];
};

// mechanized infantry or armor
if (_vehicle isKindOf "Tank") exitWith {
    if (getNumber (_configPath >> "transportSoldier") > 0) then {
        format["%1mech_inf", _markerSide];
    } else {
        format["%1armor", _markerSide];
    };
};

// ship
if (_vehicle isKindOf "Ship") exitWith {
    format["%1naval", _markerSide];
};

// default is unkown
format["%1unknown", _markerSide];

_markerSide