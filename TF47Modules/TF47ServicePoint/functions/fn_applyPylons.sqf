/**
 *  @author Willard
 *  @description
 *  Adds pylon loadout to a vehicle
 *  @params 
 *      param 0: The vehicle <object> (required)
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["applyAceLoadout called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if(_vehicle == player) exitWith {
    ["You are not in a valid vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};
_tickTime = 0.01;
_time = _tickTime * (lbSize 1500);
for "_i" from 0 to 100 do {
	if((_i mod 25) == 0) then {
		systemChat format["TF47 Service Point | Pylons: %1%2 fertig", _i, "%"];
	};
	//sleep _time;
};

/*
_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> 
	typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> 
	"Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	*/

for "_i" from 0 to ((lbSize 1500) - 1) do {
	_data = lbData [1500, _i];
	if(_data != "") then {
		_data = call compile _data;
		_magData = call compile (_data select 2);
		if((_magData select 1) == "") then {
			//_vehicle setPylonLoadOut [_i + 1, (_magData select 0), true, []];
			[_vehicle, [_i + 1, (_magData select 0), true, 
					[]]] remoteExecCall 
        			["setPylonLoadOut", 
					(_vehicle turretOwner [])];
		} else {
			/*
			_vehicle setPylonLoadOut [_i + 1, (_magData select 0), true, 
				[_magData select 1]];
			*/
				[_vehicle, [_i + 1, (_magData select 0), true, 
					[_magData select 1]]] remoteExecCall 
        			["setPylonLoadOut", 
					(_vehicle turretOwner [0])];
		};
	};
};