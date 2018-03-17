// by Xeno
#define THIS_FILE "fn_target_clear_client.sqf"
#include "..\..\x_setup.sqf"

if (isDedicated) exitWith {};

playSound "d_fanfare";

private _extra_bonusn = _this;

if (!isNil "d_obj00_task") then {
	d_obj00_task = nil;
	["d_obj00", "Succeeded", false] call BIS_fnc_taskSetState;
};

if (!isNil "d_current_task") then {
	[d_current_task, "Succeeded", true] call BIS_fnc_taskSetState;
};

private _mt_str = format [localize "STR_DOM_MISSIONSTRING_570", d_cur_tgt_name];
if (count d_resolved_targets < d_MainTargets) then {
#ifndef __TT__
	if (_extra_bonusn != "") then {
		private _bonus_string = format[localize "STR_DOM_MISSIONSTRING_571", [_extra_bonusn, "CfgVehicles"] call d_fnc_GetDisplayName];
		
		hint composeText[
			parseText format ["<t color='#ffffffff' size='1.5'>%1</t>", _mt_str], lineBreak, lineBreak,
			localize "STR_DOM_MISSIONSTRING_572", lineBreak,lineBreak,
			_bonus_string, lineBreak,lineBreak,
			localize "STR_DOM_MISSIONSTRING_573"
		];
	} else {
		hint composeText[
			parseText format ["<t color='#ffffffff' size='1.5'>%1</t>", _mt_str], lineBreak, lineBreak,
			localize "STR_DOM_MISSIONSTRING_572", lineBreak,lineBreak,
			localize "STR_DOM_MISSIONSTRING_573"
		];
	};
#else
	private _kill_points_blufor = d_points_array select 2;
	private _kill_points_opfor = d_points_array select 3;
	private _winner_string = switch (d_mt_winner) do {
		case 1: {format [localize "STR_DOM_MISSIONSTRING_575", _kill_points_blufor, _kill_points_opfor, d_tt_points select 0]};
		case 2: {format [localize "STR_DOM_MISSIONSTRING_576", _kill_points_opfor, _kill_points_blufor, d_tt_points select 0]};
		case 3: {format [localize "STR_DOM_MISSIONSTRING_577", _kill_points_opfor, d_tt_points select 1]};
		default {""};
	};
	
	if (_extra_bonusn select 0 != "" || {_extra_bonusn select 0 != ""}) then {
		private _vecnn = switch (d_player_side) do {
			case blufor: {_extra_bonusn select 0};
			case opfor: {_extra_bonusn select 1};
			default {""};
		};
		
		if (d_mt_winner == 1 && {d_player_side == blufor} || {d_mt_winner == 2 && {d_player_side == opfor} || {d_mt_winner == 3}}) then {
			private _bonus_string = format[localize "STR_DOM_MISSIONSTRING_571", [_vecnn, "CfgVehicles"] call d_fnc_GetDisplayName];
			hint composeText[
				parseText("<t color='#ffffffff' size='1.5'>" + _mt_str + "</t>"), lineBreak,lineBreak,
				localize "STR_DOM_MISSIONSTRING_572", lineBreak,lineBreak,
				_bonus_string, lineBreak,lineBreak,
				localize "STR_DOM_MISSIONSTRING_573"
			];
		} else {
			hint composeText[
				parseText("<t color='#ffffffff' size='1.5'>" + _mt_str + "</t>"), lineBreak,lineBreak,
				localize "STR_DOM_MISSIONSTRING_573"
			];
		};
	} else {
		hint composeText[
			parseText("<t color='#ffffffff' size='1.5'>" + _mt_str + "</t>"), lineBreak,lineBreak,
			localize "STR_DOM_MISSIONSTRING_572", lineBreak,lineBreak,
			localize "STR_DOM_MISSIONSTRING_573"
		];
	};
	"d_tt_winner" cutText [_winner_string, "PLAIN"];
#endif
	if (d_with_ranked) then {
		if (player distance2D d_cur_tgt_pos < (d_ranked_a select 10)) then {
			[playerSide, "HQ"] sideChat format [localize "STR_DOM_MISSIONSTRING_574", d_ranked_a select 9];
			0 spawn {
				scriptName "spawn_x_target_clear_client_sendscore";
				sleep (0.5 + random 2);
				[player, d_ranked_a select 9] remoteExecCall ["addScore", 2];
			};
		};
	};
} else {
#ifndef __TT__
	hint  composeText[
		parseText("<t color='#f02b11ed' size='1'>" + format [localize "STR_DOM_MISSIONSTRING_570", d_cur_tgt_name] + "</t>"), lineBreak, lineBreak,
		localize "STR_DOM_MISSIONSTRING_572"
	];
#else
	private _kill_points_blufor = d_points_array select 2;
	private _kill_points_opfor = d_points_array select 3;
	private _winner_string = switch (d_mt_winner) do {
		case 1: {format [localize "STR_DOM_MISSIONSTRING_575", _kill_points_blufor, _kill_points_opfor, d_tt_points select 0]};
		case 2: {format [localize "STR_DOM_MISSIONSTRING_576", _kill_points_opfor, _kill_points_blufor, d_tt_points select 0]};
		case 3: {format [localize "STR_DOM_MISSIONSTRING_577", _kill_points_opfor, d_tt_points select 1]};
		default {""};
	};
	hint  composeText[
		parseText("<t color='#f02b11ed' size='1'>" + _mt_str + "</t>"), lineBreak,lineBreak,
		localize "STR_DOM_MISSIONSTRING_572"
	];
	"d_tt_winner" cutText [_winner_string, "PLAIN"];
#endif
};
