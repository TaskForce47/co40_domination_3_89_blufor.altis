// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_buttonclickrespawn.sqf"
#include "..\..\x_macros.sqf"

if (isDedicated) exitWith {};

__TRACE_1("","d_beam_target")
if (d_beam_target == "") exitWith {
	__TRACE("exit, beam target empty")
};

private _curvismode = player getVariable "d_curvismode";
if (!isNil "_curvismode" && {_curvismode == 1 && {player call d_fnc_hasnvgoggles}}) then {
	player action ["NVGoggles", player];
};

private _respawn_pos = [0,0,0];
private _respawn_pos_carrier = [];
__TRACE("black out")
"xr_revtxt" cutText [localize "STR_DOM_MISSIONSTRING_917", "BLACK OUT", 0.2];

player setVariable ["xr_hasusedmapclickspawn", true];

if (d_beam_target == "D_BASE_D") then {
	_respawn_pos = player getVariable ["d_resp_pos", []];
	if (_respawn_pos isEqualTo []) then {
		markerPos "base_spawn_1";
		_respawn_pos set [2, 0];
	};
	_respawn_pos_carrier = player getVariable ["d_resp_pos_asl", []];
	if (_respawn_pos_carrier isEqualTo []) then {
		_respawn_pos_carrier =+ _respawn_pos;
		_respawn_pos_carrier set [2, d_carrier_height];
	};
	d_player_in_base = true;
} else {
	if (d_beam_target == "D_SQL_D") then {
		private _lead = leader (group player);
		_respawn_pos = [(vehicle _lead) modelToWorldVisual [0, -8, 0], getPosASL _lead] select (isNull objectParent _lead);
		_respawn_pos set [2, _lead distance (getPos _lead)];
#ifndef __TT__
		d_player_in_base = player inArea d_base_array;
#else
		d_player_in_base = player inArea (d_base_array select 0) || {player inArea (d_base_array select 1)};
#endif
	} else {
		private _uidx = d_add_resp_points_uni find d_beam_target;
		if (_uidx != -1) then {
			_respawn_pos = (d_additional_respawn_points select _uidx) select 1;
			//_respawn_pos set [2, 0];
			d_player_in_base = false;
		} else {
			private _mrs = missionNamespace getVariable [d_beam_target, objNull];
			_respawn_pos = _mrs call d_fnc_posbehindvec;
			(boundingBoxReal _mrs) params ["_p1", "_p2"];
			private _maxHeight = abs ((_p2 select 2) - (_p1 select 2)) / 2;
			_respawn_pos set [2, (_mrs distance (getPos _mrs)) - _maxHeight];
			d_player_in_base = false;
		};
	};
};

__TRACE_1("","_respawn_pos")

sleep 1;
__TRACE("stopspect = true")
xr_stopspect = true;
player setVariable ["xr_plno3dd", true, true];
player setVariable ["xr_pluncon", false, true];
[player, false] remoteExecCall ["setCaptive"];
sleep 0.5;

private _mhqobj = objNull;
if (d_beam_target != "D_BASE_D" && {d_beam_target != "D_SQL_D" && {!(d_beam_target in d_add_resp_points_uni)}}) then {
	{
		if (_x getVariable ["d_vec_type", ""] == "MHQ") exitWith {
			_mhqobj = _x;
		};
		false
	} count (_respawn_pos nearEntities ["All", 25]);
};
[player, 105] remoteExecCall ["xr_fnc_handlenet"];
__TRACE_1("","_mhqobj")
if (!isNull _mhqobj) then {
	private _newppos = _mhqobj call d_fnc_posbehindvec;
	(boundingBoxReal _mhqobj) params ["_p1", "_p2"];
	private _maxHeight = abs ((_p2 select 2) - (_p1 select 2)) / 2;
	_newppos set [2, (_mhqobj distance (getPos _mhqobj)) - _maxHeight];
	player setDir (getDirVisual _mhqobj);
	player setVehiclePosition [_newppos, [], 0, "NONE"]; // CAN_COLLIDE ?
	{player reveal _x;false} count (nearestObjects [player, d_rev_respawn_vec_types, 30]);
	call d_fnc_retrieve_layoutgear;
} else {
	private _domovevec = false;
	if (d_beam_target != "D_SQL_D")	then {
		call d_fnc_retrieve_layoutgear;
	} else {
		private _leader = leader (group player);
		private _emptycargo = [0, (vehicle _leader) emptyPositions "cargo"] select (!isNull objectParent _leader);
		if (_emptycargo > 0) then {
			_domovevec = true;
		};
	};
	if (!_domovevec) then {
		player allowDamage false;
		if (surfaceIsWater _respawn_pos) then {
			player setPosASL _respawn_pos_carrier;
		} else {
			player setPos _respawn_pos;
			//if (d_beam_target == "D_BASE_D") then {
			//	player setVehiclePosition [_respawn_pos, [], 2, "CAN_COLLIDE"]; // CAN_COLLIDE ?
			//} else {
				//player setVehiclePosition [_respawn_pos, [], 0, "CAN_COLLIDE"]; // CAN_COLLIDE ?
			//};
		};
		player allowDamage true;
	} else {
		player moveInCargo (vehicle leader (group player));
	};
};

player setVariable ["xr_plno3dd", nil, true];

d_last_beam_target = d_beam_target;
d_beam_target = "";
player setDamage 0;
__TRACE("MapClickRespawn, black in")
"xr_revtxt" cutText [localize "STR_DOM_MISSIONSTRING_918", "BLACK IN", 6];
if (xr_max_lives != -1) then {
	0 spawn {
		sleep 7;
		if (xr_max_lives != -1) then {
			hintSilent format [localize "STR_DOM_MISSIONSTRING_933", player getVariable "xr_lives"];
		};
		if (d_with_ai && {alive player && {!(player getVariable ["xr_pluncon", false])}}) then {[] spawn d_fnc_moveai};
	};
};
__TRACE("MapClickRespawn done")