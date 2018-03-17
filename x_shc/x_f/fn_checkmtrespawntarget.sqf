// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_checkmtrespawntarget.sqf"
#include "..\..\x_setup.sqf"

__TRACE_1("","_this")

params ["_vec", "_type"]; // type 0 = barracks, 1 = vehicles

if (_type == 0) then {
	_vec addEventHandler ["killed", {
		d_mt_barracks_down = true;
		[missionNamespace, ["d_mt_barracks_down", true]] remoteExecCall ["setVariable", 2];
		[51] remoteExecCall ["d_fnc_DoKBMsg", 2];
		(param [0]) spawn {
			sleep (10 + random 10);
			_this setDamage 0;
			deleteVehicle _this;
		};
		(param [0]) removeAllEventHandlers "killed";
	}];
} else {
	_vec addEventHandler ["killed", {
		d_mt_mobile_hq_down = true;
		[missionNamespace, ["d_mt_mobile_hq_down", true]] remoteExecCall ["setVariable", 2];
		[53] remoteExecCall ["d_fnc_DoKBMsg", 2];
		(param [0]) spawn {
			sleep (60 + random 60);
			_this setDamage 0;
			deleteVehicle _this;
		};
		(param [0]) removeAllEventHandlers "killed";
	}];
};
_vec addEventHandler ["handleDamage", {_this call d_fnc_CheckMTShotHD}];