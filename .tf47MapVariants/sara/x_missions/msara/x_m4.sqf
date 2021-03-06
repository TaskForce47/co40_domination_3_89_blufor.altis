// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_m4.sqf"
#include "..\..\x_setup.sqf"

d_x_sm_pos = [[12104.7,17750,0], [12114.3,17739.1,0], [12110.8,17656.7,0]]; // index: 4,   Water tower (chemical weapons) Cabo Santa Lucia 
d_x_sm_type = "normal"; // "convoy"

if (hasInterface) then {
	d_cur_sm_txt = localize "STR_DOM_MISSIONSTRING_782";
	d_current_mission_resolved_text = localize "STR_DOM_MISSIONSTRING_783";
};

if (call d_fnc_checkSHC) then {
	private _poss = d_x_sm_pos select 0;
	private _vec = createVehicle ["Land_watertower1", _poss, [], 0, "NONE"];
	_vec setPos _poss;
	_vec call d_fnc_addKilledEHSM;
	d_x_sm_vec_rem_ar pushBack _vec;
	sleep 2.123;
	["specops", 1, "allmen", 1, d_x_sm_pos select 1, 80, true] spawn d_fnc_CreateInf;
	sleep 2.123;
	["aa", 1, "tracked_apc", 1, "tank", 1, d_x_sm_pos select 2, 1, 100, true] spawn d_fnc_CreateArmor;
};