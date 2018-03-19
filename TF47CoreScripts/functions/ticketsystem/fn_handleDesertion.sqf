/**
 *  @author Willard
 *  @description
 *  Handles the deserion of a vehicele
 *  the Database
 *  @params 
 *      param 0: Vehicle <object>
 *  @return nothing
 */

 _result = (_this select 0) params [
    ["_vehicle", objNull, [objNull]]
];

if(!isServer) exitWith {
     ["registerVehicle not called on Server!", "Error", true] spawn
        BIS_fnc_guiMessage;
    diag_log "handleDesertion not called on Server!";
};

if(isNull _vehicle) exitWith {
    ["handleDesertion called with null vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
    diag_log "registerVehicle called with null vehicle!";
	_handle = missionNamespace getVariable [
		format["tf47_core_ticketsystem_timeoutHandle_%1", 
		_vehicle call BIS_fnc_netId], -1];
	//_handle = _vehicle getVariable ["tf47_core_ticketsystem_timeoutHandle", -1];
	if(_handle != -1) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
};

if(!(alive _vehicle)) exitWith {};

if(count (crew _vehicle) > 0 || 
	((getPos _vehicle) distance 
	(getMarkerPos tf47_core_ticketsystem_desertionMarker)) < 1000) exitWith {
};

_time = missionNamespace getVariable [
		format["tf47_core_ticketsystem_getoutTime_%1", 
		_vehicle call BIS_fnc_netId], time];
//_time = _vehicle getVariable ["tf47_core_ticketsystem_getoutTime", time];

_time = time - _time;
if(_time > tf47_core_ticketsystem_desertionTime) then {
	_handle = missionNamespace getVariable [
		format["tf47_core_ticketsystem_timeoutHandle_%1", 
		_vehicle call BIS_fnc_netId], -1];
	//_handle = _vehicle getVariable ["tf47_core_ticketsystem_timeoutHandle", -1];
	if(_handle != -1) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	missionNamespace setVariable 
        [format ["tf47_core_ticketsystem_deserted_%1", 
        (_vehicle call BIS_fnc_netId)], true, true];
	//_vehicle setVariable ["tf47_core_ticketsystem_deserted", true, true];
	
	[_vehicle, 2] call tf47_core_ticketsystem_fnc_changeTickets;
	missionNamespace setVariable 
        [format ["tf47_core_ticketsystem_despawn_%1", 
        (_vehicle call BIS_fnc_netId)], true, true];
	//_vehicle setVariable ["tf47_core_ticketsystem_despawn", true, true];
	_null = [_vehicle] spawn {
		_vehicle = _this select 0;
		_vehicle lock true;
		sleep 60;
		_vehicle setPos [0,0,0];
		_vehicle setDamage 1;
	};
};