/**
 *  @author Willard
 *  @description
 *  Spawns a vehicle
 *  @params none
 *  @return nothing
 */
 // get the config
_index = lnbCurSelRow 1500;

diag_log lnbData [1500, [_index, 0]];

_data = call compile lnbData [1500, [_index, 0]];

diag_log _data;

_marker = _data select 0;
_vehicleClass = _data select 1;

if(count (nearestObjects 
	[getMarkerPos _marker, ["LandVehicle","Air", "Ship", "Thing"], 5]) >= 1)
	exitWith {
	systemChat "Es gibt nicht genug Platz um dieses Fahrzeug zu spawnen!";
};

// spawn the vehicle
_vehicle = createVehicle [_vehicleClass, getMarkerPos _marker, [], 0,
	"CAN_COLLIDE" ];
_vehicle setDir (markerDir _marker);

if(_vehicleClass == "B_supplyCrate_F" ||
	_vehicleClass == "Box_NATO_Support_F") then {
	clearBackpackCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
};

if((_vehicleClass == "RHS_M119_WD" || _vehicleClass == "RHS_M119_D") && 
	!isNil "ace_cargo_fnc_setSize") then {
	[_vehicle, -1] call ace_cargo_fnc_setSize;
};

if(_vehicleClass == "Land_CanisterFuel_F" 
	&& !isNil "ace_refuel_fnc_makeJerryCan") then {
	[_vehicle] call ace_refuel_fnc_makeJerryCan;
	[_vehicle, true] remoteExecCall ["ace_dragging_fnc_setDraggable"];
	[_vehicle, true] remoteExecCall ["ace_dragging_fnc_setCarryable"];
	[_vehicle, 1] call ace_cargo_fnc_setSize;
};

if(_vehicleClass in ["rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy",
	"rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy"]) then {
	_vehicle setVariable ["ace_medical_isMedicalFacility", true, true];
};

if(_vehicleClass in ["rhsusf_M1230a1_usarmy_wd", "rhsusf_M1230a1_usarmy_d",
	"RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_UH60M_MEV2", 
	"RHS_UH60M_MEV"]) then {
	_vehicle setVariable ["ace_medical_medicClass", 1, true];
};

if((getText (configfile >> "CfgVehicles" >> _vehicleClass >> "crew")) in [
	"B_UAV_AI", "O_UAV_AI", "I_UAV_AI", "C_UAV_AI_F"]) then {
	createVehicleCrew _vehicle;
};

// handle corescripts
if((_data select 3) != -1 && 
	!isNil "tf47_core_ticketsystem_fnc_registerVehicle") then {
	[_vehicle, _data select 3] remoteExecCall 
		["tf47_core_ticketsystem_fnc_registerVehicle", 2];
};

if((_data select 2) > 0 && (count (_data select 4)) > 0 &&
	!isNil "tf47_core_whitelist_fnc_registerWhitelist") then {
	[_vehicle, _data select 2, _data select 4] remoteExecCall 
		["tf47_core_whitelist_fnc_registerWhitelist", 2];
};

//equip fries
if(isNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) 
	>> "ace_fastroping_enabled")) then {
	[_vehicle] remoteExecCall ["ace_fastroping_fnc_equipFRIES", 2];
};