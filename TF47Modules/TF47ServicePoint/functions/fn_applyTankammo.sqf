/**
 *  @author Willard
 *  @description
 *  Adds tank ammo to the tank
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

_count = [parseNumber ctrlText 1400];
_count pushBack (parseNumber ctrlText 1401);
_count pushBack (parseNumber ctrlText 1402);

_ammo = [lbData [2100, lbCurSel 2100]];
_ammo pushBack (lbData [2101, lbCurSel 2101]);
_ammo pushBack (lbData [2102, lbCurSel 2102]);

_sum = 0;
{
	_sum = _sum + _x;
} forEach _count;

_vehicleIndex = ((tf47_modules_sp_ammo_tankAmmo select 0)     
	find ((tf47_modules_sp_ammo_tankAmmo select 0)     
	select {_vehicle isKindOf _x} select 0));
_maxAmmo = ((tf47_modules_sp_ammo_tankAmmo select 2) select _vehicleIndex);

if(_sum > _maxAmmo) 
	exitWith {
	hint format["Es können nur maximal %1 Schuss mitgeführt werden", _maxAmmo];
};

_tickTime = 0.01;
_time = _tickTime * _maxAmmo;
for "_i" from 0 to 100 do {
	if((_i mod 25) == 0) then {
		systemChat format["TF47 Service Point | Bewaffnung: %1%2 fertig", _i, "%"];
	};
	//sleep _time;
};

[_vehicle] call tf47_modules_servicepoint_fnc_rearmVehicle;

_mainGunParentClass = ((tf47_modules_sp_ammo_tankAmmo select 3) 
	select _vehicleIndex);

{
	if(_x isKindOf [_mainGunParentClass, configFile >> "CfgMagazines"] || 
		_x == _mainGunParentClass) then {
		_vehicle removeMagazineTurret [_x, [0]];
	};
} foreach (_vehicle magazinesTurret [0]);

// BW Mod is 'special'
if(_vehicle isKindOf "BWA3_Leopard_base") then {
	{
		if(_x != "" && ((_count select _forEachIndex) >= 0)) then {
			for "_i" from 1 to (_count select _forEachIndex) do {
				[_vehicle, [_x, [0], 1]] remoteExecCall 
					["addMagazineTurret", (_vehicle turretOwner [0])];
			};
		};
	} forEach _ammo;
} else {
	{
		if(_x != "" && ((_count select _forEachIndex) >= 0)) then {
			[_vehicle, [_x, [0]]] remoteExecCall ["addMagazineTurret", 
				(_vehicle turretOwner [0])];
			[_vehicle, [_x , (_count select _forEachIndex), [0]]] remoteExecCall
				["setMagazineTurretAmmo", (_vehicle turretOwner [0])];
		};
	} forEach _ammo;
};