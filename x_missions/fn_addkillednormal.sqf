// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_addkillednormal.sqf"
#include "..\x_setup.sqf"

__TRACE_1("","_this")

#ifdef __TT__
d_sm_points_blufor = 0;
d_sm_points_opfor = 0;

_this addEventhandler ["handleDamage", {
	__TRACE_1("handleDamage","_this")
	private _obj = param [3];
	if (!isNull _obj && {isPlayer _obj}) then {
		if (side (group _obj) == opfor) then {
			d_sm_points_opfor = d_sm_points_opfor + 1;
		} else {
			d_sm_points_blufor = d_sm_points_blufor + 1;
		};
	};
	__TRACE_2("","d_sm_points_blufor","d_sm_points_opfor")
}];

_this addEventHandler ["hit", {
	__TRACE_1("hit","_this")
	private _obj = param [1];
	if (!isNull _obj && {isPlayer _obj}) then {
		if (side (group _obj) == opfor) then {
			d_sm_points_opfor = d_sm_points_opfor + 1;
		} else {
			d_sm_points_blufor = d_sm_points_blufor + 1;
		};
	};
	__TRACE_2("","d_sm_points_blufor","d_sm_points_opfor")
}];
#endif

_this addEventhandler ["killed", {_this call d_fnc_KilledSMTargetNormal}];