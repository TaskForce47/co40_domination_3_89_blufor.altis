// by Xeno
#define THIS_FILE "fn_checkdriver.sqf"
#include "..\..\x_setup.sqf"

private _enterer = param [2];
if (_enterer != player) exitWith {};

params ["_vec"];

private _exit_it = false;
private _d_side = _vec getVariable "d_side";
if (!isNil "_d_side") then {
	if (d_player_side == blufor && {_d_side == opfor}) then {
		_exit_it = true;
		[localize "STR_DOM_MISSIONSTRING_169", "SIDE"] call d_fnc_HintChatMsg;
	} else {
		if (d_player_side == opfor && {_d_side == blufor}) then {
			_exit_it = true;
			[localize "STR_DOM_MISSIONSTRING_170", "SIDE"] call d_fnc_HintChatMsg;
		};
	};
};
if (_exit_it) exitWith {
	_enterer action ["GetOut",_vec];
};