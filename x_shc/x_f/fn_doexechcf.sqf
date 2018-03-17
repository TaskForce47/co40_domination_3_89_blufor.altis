// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_doexechcf.sqf"
#include "..\..\x_setup.sqf"

params ["_type"];

if (_type == 0) then {
	execFSM "fsms\fn_XClearSidemission.fsm";
} else {
#ifndef __TT__
	if (!isNull d_mt_barracks_obj) then {
		d_mt_barracks_obj spawn {
			sleep (60 + random 60);
			_this setDamage 0;
			deleteVehicle _this;
		};
	};
	if (!isNull d_mt_mobile_hq_obj) then {
		d_mt_mobile_hq_obj spawn {
			sleep (60 + random 60);
			_this setDamage 0;
			deleteVehicle _this;
		};
	};
#endif
	(param [1]) execFSM "fsms\fn_DeleteUnits.fsm";
};