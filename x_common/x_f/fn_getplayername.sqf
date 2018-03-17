// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_getplayername.sqf"
#include "..\..\x_setup.sqf"
//private _np = (param [0]) getVariable "d_pl_name_orig";
//if (isNil "_np") then {
	//_np = (name (param [0])) splitString """'" joinString "";
	//if !(_np isEqualTo "Error: No unit" && {!(_np isEqualTo "")}) then {
		//(param [0]) setVariable ["d_pl_name_orig", _np];
	//};
//};
//_np

params ["_u"];

private _np = _u getVariable "d_plname";
if (isNil "_np") then {
	//if (isMultiplayer) then {
	//	if (str _u in d_player_entities && {!isPlayer _u}) then {
			//remoteExec ["d_fnc_warnplayer", _u];
		//};
	//};
	_np = (name _u) splitString """'" joinString "";
	_u setVariable ["d_plname", _np];
};
_np
