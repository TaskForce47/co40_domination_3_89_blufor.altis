// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_cgraa.sqf"
#include "..\..\x_setup.sqf"

{
	private _grp = [param [0]] call d_fnc_creategroup;
	if (d_with_ai) then {
		[_grp, ["d_do_not_delete", true]] remoteExecCall ["setVariable", 2];
	};
	private _av = (([1, markerPos _x, param [1], _grp, markerDir _x] call d_fnc_makevgroup) select 0) select 0;
	_grp deleteGroupWhenEmpty true;
	_av lock true;
	if (!isNull (driver _av)) then {
		_av lockDriver true;
		_av deleteVehicleCrew (driver _av);
		_av lock 2;
	};
	false
} count (allMapMarkers select {_x select [0, 15] == "d_base_anti_air"});
