// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_tkkickcheck.sqf"
#include "..\..\x_setup.sqf"

private _tk = param [2];
_tk addScore (d_sub_tk_points * -1);
private _uid = getPlayerUID _tk;
__TRACE_2("TKKickCheck","_tk","_uid")
private _p = d_player_store getVariable _uid;
if (!isNil "_p") then {
	private _numtk = (_p select 7) + 1;
	_p set [7, _numtk];
	if (_numtk >= d_maxnum_tks_forkick) exitWith {
		private _pna = _p select 6;
		diag_log format ["Player %1 was kicked automatically because of teamkilling, # team kills: %3, ArmA 2 Key: %2", _pna, _uid, _numtk];
		[format [localize "STR_DOM_MISSIONSTRING_507", _pna, _numtk], "GLOBAL"] remoteExecCall ["d_fnc_HintChatMsg", [0, -2] select isDedicated];
		"LOSER" remoteExecCall ["endMission", _tk];
		if (d_database_found) then {
			"extdb3" callExtension format ["1:dom:teankillsAdd:%1", _uid];
		};
	};
};