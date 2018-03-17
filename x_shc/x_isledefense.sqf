// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_isledefense.sqf"
#include "..\x_setup.sqf"

if !(call d_fnc_checkSHC) exitWith {};

#ifndef __DEBUG__
sleep 85.321;
#else
sleep 5;
d_all_igrps_vecs = [];
#endif

__TRACE("before isServer check")

if (isMultiplayer && {isServer && {!isNil "HC_D_UNIT"}}) exitWith {};

__TRACE("after isServer check")

d_old_old_start = [0,0,0];

private _isle_grps = [];
for "_i" from 1 to (d_with_isledefense select 4) do {
	_isle_grps pushBack (call d_fnc_make_isle_grp);
	sleep 3.012;
};
__TRACE_1("","_isle_grps")

while {true} do {
#ifndef __DEBUG__
	call d_fnc_mpcheck;
	sleep 300 + random 300;
#else
	sleep 10;
#endif
	{
		private _igrp = _x select 0;
		private _make_new = false;
#ifdef __DEBUG__
		d_all_igrps_vecs append (_x select 2);
#endif
		if (!isNull _igrp) then {
			if ((_igrp call d_fnc_GetAliveUnitsGrp) == 0) then {
				_make_new = true;
			} else {
				{
#ifndef __DEBUG__
					if (_x distance2D (_x getVariable "d_cur_pos") < 100 || {!canMove _x}) exitWith {
#else
					if (_x distance2D (_x getVariable "d_cur_pos") < 10 || {!canMove _x}) exitWith {
#endif
						_make_new = true;
					};
					_x setVariable ["d_cur_pos", getPosASL _x];
					false
				} count (_x select 2);
				
			};
		} else {
			_make_new = true;
		};
		sleep 0.3;
		if (_make_new) then {
			{_x call d_fnc_DelVecAndCrew; sleep 0.01} forEach ((_x select 2) select {!isNull _x});
			sleep 0.01;
			{deleteVehicle _x; sleep 0.01} forEach (_x select 1);
			_isle_grps set [_forEachIndex, call d_fnc_make_isle_grp];
			sleep 3.012;
		};
#ifndef __DEBUG__
		sleep 50 + random 50;
#else
		sleep 5;
#endif
	} forEach _isle_grps;
};