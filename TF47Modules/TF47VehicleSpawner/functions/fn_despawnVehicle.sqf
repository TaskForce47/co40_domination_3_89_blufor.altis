/**
 *  @author Willard
 *  @description
 *  Despawns a vehicle
 *  @params
 *      param 0: The Vehicle Spawner Marker <NUMBER> (required)
 *  @return nothing
 */
 // get the config
_result = _this params [
    ["_marker", "", [""]]
];

if(_marker == "") exitWith {};

_nearestObjects = nearestObjects [getMarkerPos _marker,
	["LandVehicle","Air", "Ship", "Thing"], 5];

if(count _nearestObjects < 1) exitWith {};

if(typeOf (_nearestObjects select 0) == "ACE_friesAnchorBar") then {
	deleteVehicle (_nearestObjects select 0);
};

_vehicle = (_nearestObjects select 0);
_vehicle setFuel 0;
if(!(_vehicle isKindOf "UAV")) then {
	{
		moveOut _x;
	} forEach crew _vehicle;

	// delete ai and dead/dc people
	{
		_vehicle deleteVehicleCrew _x;
	} forEach (crew _vehicle);

	waitUntil {count (crew _vehicle) == 0};

	_vehicle lock true;
};

missionNamespace setVariable
	[format ["tf47_core_ticketsystem_despawn_%1",
	(_vehicle call BIS_fnc_netId)], true, true];
//_vehicle setVariable ["tf47_core_ticketsystem_despawn", true, true];

_handle = missionNamespace getVariable [
	format["tf47_core_ticketsystem_timeoutHandle_%1",
	_vehicle call BIS_fnc_netId], -1];
//_handle = _vehicle getVariable ["tf47_core_ticketsystem_timeoutHandle",           -1];
if(_handle != -1) then {
	[_handle] call CBA_fnc_removePerFrameHandler;
};
_vehicle setvariable ["BIS_fnc_moduleRespawnVehicle_first", true];

sleep 5;
_vehicle setPos [0,0,0];

sleep 10;
_vehicle setDamage 1;

sleep 30;
deleteVehicle _vehicle;