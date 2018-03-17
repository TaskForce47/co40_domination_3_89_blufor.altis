// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_setupplayer.sqf"
#include "..\x_setup.sqf"

#include "\A3\ui_f\hpp\defineDIKCodes.inc"

diag_log [diag_frameno, diag_ticktime, time, "Executing Dom x_setupplayer.sqf"];

d_string_player = str player;
#ifdef __OWN_SIDE_BLUFOR__
d_player_side = blufor;
#endif
#ifdef __OWN_SIDE_OPFOR__
d_player_side = opfor;
#endif
#ifdef __OWN_SIDE_INDEPENDENT__
d_player_side = independent;
#endif

#ifdef __TT__
if (d_string_player in d_entities_tt_blufor) then {
	d_mob_respawns = d_mob_respawns_blufor;
	d_player_side = blufor;
	d_own_side = "WEST";
	d_own_sides = ["WEST"];
	d_own_sides_o = [west];
	d_create_bike = [["B_Quadbike_01_F"], ["B_Quadbike_01_F", "B_T_LSV_01_unarmed_F"]] select d_tanoa;
	d_FLAG_BASE = d_WFLAG_BASE;
	d_player_entities = d_entities_tt_blufor;
	
	{
		_x setMarkerAlphaLocal 1;
		false
	} count ["d_chopper_service", "d_wreck_service", "d_teleporter", "d_aircraft_service", "bonus_air", "bonus_vehicles", "d_Ammobox_Reload", "d_vec_service", "Start", "d_runwaymarker"];
	
	d_jump_helo = "B_Heli_Transport_01_F";
	d_UAV_Small = "B_UAV_01_F";
	d_UAV_Terminal = "B_UavTerminal";
} else {
	d_mob_respawns = d_mob_respawns_opfor;
	d_player_side = opfor;
	d_own_side = "EAST";
	d_own_sides = ["EAST"];
	d_own_sides_o = [east];
	d_create_bike = [["O_Quadbike_01_F"], ["O_Quadbike_01_F", "O_T_LSV_02_unarmed_F"]] select d_tanoa;
	d_FLAG_BASE = d_EFLAG_BASE;
	d_player_entities = d_entities_tt_opfor;
	
	{
		_x setMarkerAlphaLocal 1;
		false
	} count ["d_chopper_serviceR","d_wreck_serviceR","d_teleporter_1","d_aircraft_serviceR","bonus_airR","bonus_vehiclesR","d_Ammobox ReloadR","Start_opfor","d_vehicle_serviceR", "d_runwaymarker_o"];
	
	d_jump_helo = "O_Heli_Light_02_unarmed_F";
	d_UAV_Small = "O_UAV_01_F";
	d_UAV_Terminal = "O_UavTerminal";
};
d_side_player = d_player_side;
#endif

player setVariable ["d_tk_cutofft", time + 3];
player setVariable ["xr_pluncon", false];
d_player_in_base = true;
d_player_in_air = false;

d_player_vecs = [];

if !(d_additional_respawn_points isEqualTo []) then {
	{
		if (_x select 1 isEqualType "") then {
			if !(markerPos (_x select 1) isEqualTo [0,0,0]) then {
#ifdef __TT__
				if (d_player_side != _x select 3) then {
					(_x select 1) setMarkerAlphaLocal 0;
					d_additional_respawn_points set [_forEachIndex, -1];
				} else {
					_x set [1, markerPos (_x select 1)];
				};
#else
				_x set [1, markerPos (_x select 1)];
#endif
			} else {
#ifdef __TT__
				if (d_player_side != _x select 3) then {
					d_additional_respawn_points set [_forEachIndex, -1];
				} else {
					private _dadao = missionNamespace getVariable (_x select 1);
					_x set [1, getPos _dadao];
					_dadao addAction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_533"], {_this call d_fnc_teleportx}];
					_dadao setVariable ["d_jf_id", _dadao addAction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_296"], {_this spawn d_fnc_paraj}, 0]];
					if (count _x > 4 && {_x select 4}) then {
						_dadao addAction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_1816"], {[0, 0, 0, [d_create_bike select 0, 1]] spawn d_fnc_bike}];
					};
				};
#else
				private _dadao = missionNamespace getVariable (_x select 1);
				_x set [1, getPos _dadao];
				_dadao addAction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_533"], {_this call d_fnc_teleportx}];
				_dadao setVariable ["d_jf_id", _dadao addAction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_296"], {_this spawn d_fnc_paraj}, 0]];
				if (count _x > 4 && {_x select 4}) then {
					_dadao addAction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_1816"], {[0, 0, 0, [d_create_bike select 0, 1]] spawn d_fnc_bike}];
				};
#endif
			};
		};
	} forEach d_additional_respawn_points;
#ifdef __TT__
	d_additional_respawn_points = d_additional_respawn_points - [-1];
#endif
};

if (d_WithRevive == 1 && {!d_with_ace}) then {
	player addEventHandler ["handleDamage", {_this call xr_fnc_ClientHD}];
};

if (!isServer) then {execVM "x_bikb\kbinit.sqf"};

["d_dummy_marker", [0, 0, 0], "ICON", "ColorBlack", [1, 1], "", 0, "Empty"] call d_fnc_CreateMarkerLocal;

if (d_the_end) exitWith {
	endMission "END1";
	forceEnd;
};

if (!isMultiplayer) then {
	0 spawn {
		scriptName "spawn_playerstuff";
		sleep 1 + random 3;		
		d_player_autokick_time = d_AutoKickTime;
		xr_phd_invulnerable = false;
		sleep 10;
		if (d_still_in_intro) then {
			d_still_in_intro = false;
		};
	};
};

if (d_WithWinterWeather == 0 && {d_weather == 0}) then {execVM "scripts\weather_winter.sqf"};
if (d_WithWinterWeather == 1 && {d_weather == 0 && {d_withsandstorm == 0}}) then {0 spawn d_fnc_sandstorm};

if (d_with_ranked) then {
	// basic rifle at start
	private _weapp = "";
	private _magp = "";
	switch (d_own_side) do {
		case "WEST": {
			_weapp = "arifle_MX_F";
			_magp = "30Rnd_65x39_caseless_mag";
		};
		case "EAST": {
			_weapp = "arifle_MX_F";
			_magp = "30Rnd_65x39_caseless_mag";
		};
		case "GUER": {
			_weapp = "arifle_MX_F";
			_magp = "30Rnd_65x39_caseless_mag";
		};
	};
	removeAllWeapons player;
	player addMagazines [_magp, 6];
	player addWeapon _weapp;

	player setVariable ["d_pprimweap", primaryWeapon player];
	player setVariable ["d_psecweap", secondaryWeapon player];
	player setVariable ["d_phandgweap", handgunWeapon player];
	player setVariable ["d_pprimweapitems", primaryWeaponItems player];
	player setVariable ["d_psecweapitems", secondaryWeaponItems player];
	player setVariable ["d_phandgweapitems", handgunItems player];
	player addEventhandler ["Put", {call d_fnc_store_rwitems}];
	
	if (!d_with_ace) then {
		player addEventHandler ["handleHeal", {_this call d_fnc_handleheal}];
	};
	
	d_sm_p_pos = nil;
	player addEventhandler ["SeatSwitchedMan", {_this call d_fnc_seatswitchedman}];
};

// available in non ranked versions too, removes nvg if without nvg is activated to avoid cheating
player addEventhandler ["Take", {_this call d_fnc_ptakeweapon}];

if (d_MissionType != 2) then {
	if !(d_resolved_targets isEqualTo []) then {
		private _codtn = count d_target_names;
		for "_i" from 0 to (count d_resolved_targets - 1) do {
			if (isNil "d_resolved_targets" || {_i >= count d_resolved_targets}) exitWith {};
#ifndef __TT__
			private _res = d_resolved_targets select _i;
#else
			private _res = (d_resolved_targets select _i) select 0;
#endif
			if (!isNil "_res" && {_res >= 0 && {_res < _codtn}}) then {
				private _tgt_ar = d_target_names select _res;
				private _cur_tgt_name = _tgt_ar select 1;
				private _tname = format ["d_obj%1", _res + 2];
				private _no = missionNamespace getVariable format ["d_target_%1", _res];
				private _tstate = if (!isNull _no && {!isNil {_no getVariable "d_recaptured"}}) then {
					"Failed"
				} else {
					"Succeeded"
				};
				[player, _tname, [format [localize "STR_DOM_MISSIONSTRING_202", _cur_tgt_name], format [localize "STR_DOM_MISSIONSTRING_203", _cur_tgt_name], format [localize "STR_DOM_MISSIONSTRING_203", _cur_tgt_name]], _tgt_ar select 0, _tstate, 2, false, "Attack", false] call BIS_fnc_taskCreate;
			};
		};
	};

	d_current_seize = "";
	if (d_current_target_index != -1 && {!d_target_clear && {!(d_cur_tgt_pos isEqualTo [])}}) then {
		d_current_seize = d_cur_tgt_name;
		"d_dummy_marker" setMarkerPosLocal d_cur_tgt_pos;
		private _tname = format ["d_obj%1", d_current_target_index + 2];
		[player, _tname, [format [localize "STR_DOM_MISSIONSTRING_202", d_current_seize], format [localize "STR_DOM_MISSIONSTRING_203", d_current_seize], format [localize "STR_DOM_MISSIONSTRING_203", d_current_seize]], d_cur_tgt_pos, true, 2, false, "Attack", false] call BIS_fnc_taskCreate;
		d_current_task = _tname;
		if (!isNil "d_obj00_task") then {
			d_obj00_task = nil;
			["d_obj00", "Succeeded", false] call BIS_fnc_taskSetState;
		};
	};
};

if (d_with_ai || {d_ParaAtBase == 0}) then {
#ifndef __TT__
	if (isNil {d_FLAG_BASE getVariable "d_jf_id"}) then {
		d_FLAG_BASE setVariable ["d_jf_id", d_FLAG_BASE addaction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_296"], {_this spawn d_fnc_paraj}, 0]];
	};
#else
	private _base_flag = [d_EFLAG_BASE, d_WFLAG_BASE] select (d_player_side == blufor);
	if (isNil {_base_flag getVariable "d_jf_id"}) then {
		_base_flag setVariable ["d_jf_id", _base_flag addaction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_296"], {_this spawn d_fnc_paraj}, 0]];
	};
#endif
};

if (d_MissionType != 2) then {
	{
		if (isNil {_x getVariable "d_jf_id"}) then {
			if (d_jumpflag_vec == "") then {
				_x setVariable ["d_jf_id", _x addAction [format ["<t color='#AAD9EF'>%1</t>", localize "STR_DOM_MISSIONSTRING_296"], {_this spawn d_fnc_paraj}, 1]];
			} else {
				_x setVariable ["d_jf_id", _x addAction [format ["<t color='#AAD9EF'>%1</t>", format [localize "STR_DOM_MISSIONSTRING_297", [d_jumpflag_vec, "CfgVehicles"] call d_fnc_GetDisplayName]], {_this spawn d_fnc_bike},[d_jumpflag_vec,1]]];
			};
		};
		false
	} count ((allMissionObjects d_flag_pole) select {!isNil {_x getVariable "d_is_jf"} && {isNil {_x getVariable "d_jf_id"}}});
};

if (d_all_sm_res) then {d_cur_sm_txt = localize "STR_DOM_MISSIONSTRING_522"} else {[false] spawn d_fnc_getsidemissionclient};

#ifndef __TT__
player addEventHandler ["Killed", {
	[param [0], param [1]] remoteExecCall ["d_fnc_plcheckkill", 2];
	[0] call d_fnc_playerspawn;
	d_player_in_vec = false;
}];
#else
if (d_player_side == blufor) then {
	player addEventHandler ["Killed", {
		[param [0], param [1]] remoteExecCall ["d_fnc_plcheckkillblufor", 2];
		[0] call d_fnc_playerspawn;
		d_player_in_vec = false;
	}];
} else {
	player addEventHandler ["Killed", {
		[param [0], param [1]] remoteExecCall ["d_fnc_plcheckkillopfor", 2];
		[0] call d_fnc_playerspawn;
		d_player_in_vec = false;
	}];
};
#endif
player addEventHandler ["respawn", {_this call d_fnc_prespawned}];

// one entry: [box_object, color as array (R, G, B, Alpha), "Text to show above box"]
d_all_p_a_boxes = [];

if !(d_ammo_boxes isEqualTo []) then {
	{
		private _boxnew = d_the_box createVehicleLocal [0,0,0];
		_boxnew setPos (_x select 0);
		[_boxnew] call d_fnc_weaponcargo;
		_boxnew allowDamage false;
#ifdef __TT__
		if (d_player_side != _x select 2) then {
			deleteMarkerLocal format ["d_bm_%1", _x select 0];
		};
#endif
		false
	} count (d_ammo_boxes select {_x isEqualType []});
};

player setVariable ["d_isinaction", false];

0 spawn {
	waitUntil {sleep 0.3;!d_still_in_intro};
	d_d3d_locs4a = localize "STR_DOM_MISSIONSTRING_1718";
#ifndef __TT__
	d_3draw_ar = [
		[d_FLAG_BASE, localize "STR_DOM_MISSIONSTRING_1644", 2.5],
		[d_vecre_trigger, localize "STR_DOM_MISSIONSTRING_524", 5],
		[d_jet_trigger, localize "STR_DOM_MISSIONSTRING_526", 5],
		[d_wreck_rep, localize "STR_DOM_MISSIONSTRING_0", 5],
		[d_AMMOLOAD, localize "STR_DOM_MISSIONSTRING_531", 5]
	];
	if (!d_ifa3lite) then {
		d_3draw_ar pushBack [d_chopper_trigger, localize "STR_DOM_MISSIONSTRING_528", 5];
	};
	if (d_carrier) then {
		d_3draw_ar pushBack [d_flag_airfield, localize "STR_DOM_MISSIONSTRING_1760", 5];
		d_3draw_ar pushBack [D_AMMOLOAD_C, localize "STR_DOM_MISSIONSTRING_531", 5];
	};
	{
		d_3draw_ar pushBack [_x, localize "STR_DOM_MISSIONSTRING_1761", 5];
		false
	} count ((allMissionObjects "EmptyDetector") select {(str _x) select [0, 20] == "d_serviceall_trigger"});
#else
	d_3draw_ar = [
		[[d_EFLAG_BASE, d_WFLAG_BASE] select (d_player_side == blufor), localize "STR_DOM_MISSIONSTRING_1644", 2.5],
		[[d_vecre_trigger2, d_vecre_trigger] select (d_player_side == blufor), localize "STR_DOM_MISSIONSTRING_524", 5],
		[[d_jet_trigger2, d_jet_trigger] select (d_player_side == blufor), localize "STR_DOM_MISSIONSTRING_526", 5],
		[[d_chopper_triggerR, d_chopper_trigger] select (d_player_side == blufor), localize "STR_DOM_MISSIONSTRING_528", 5],
		[[d_wreck_rep2, d_wreck_rep] select (d_player_side == blufor), localize "STR_DOM_MISSIONSTRING_0", 5],
		[[d_AMMOLOAD2, d_AMMOLOAD] select (d_player_side == blufor), localize "STR_DOM_MISSIONSTRING_531", 5]
	];
#endif
	addMissionEventHandler ["Draw3D", {call d_fnc_draw3dstuff}];
	
	"d_fpsresource" cutRsc ["d_fpsresource", "PLAIN"];
	if (d_player_can_call_arti > 0 || {d_player_can_call_drop > 0 || {d_string_player in d_can_call_cas || {!d_no_ai}}}) then {
		"d_RscSupportL" cutRsc ["d_RscSupportL", "PLAIN"];
	};
	
	xr_phd_invulnerable = false;
	sleep 2;
	player setVariable ["d_player_old_rank", 0];
	if (d_database_found && {d_set_pl_score_db}) then {
		d_points_needed = d_points_needed_db;
	};
	0 spawn d_fnc_playerrankloop;
};

diag_log ["Internal D Version: 3.89"];

if (!d_no_ai) then {
	if (d_with_ai) then {
		if (isNil "d_AI_HUT") then {
			0 spawn {
				scriptName "spawn_wait_for_ai_hut";
				waitUntil {sleep 0.512; !isNil "d_AI_HUT"};
				call compile preprocessFileLineNumbers "x_client\x_recruitsetup.sqf";
			};
		} else {
			call compile preprocessFileLineNumbers "x_client\x_recruitsetup.sqf";
		};

		private _grpp = group player;
		private _leader = leader _grpp;
		if (!isPlayer _leader || {player == _leader}) then {
			{
				if (isNull objectParent _x) then {
					deleteVehicle _x;
				} else {
					(vehicle _x) deleteVehicleCrew _x;
				};
				false
			} count ((units _grpp) select {!isPlayer _x});
		};
	};

	d_player_can_call_arti = 1;
	d_player_can_call_drop = 1;
	d_player_can_call_cas = 1;
	player setUnitTrait ["Medic", true];
	player setUnitTrait ["engineer", true];
} else {
	if (d_string_player in d_can_use_artillery) then {
		d_player_can_call_arti = 1;
	} else {
		enableEngineArtillery false;
	};
	if (d_string_player in d_can_call_drop_ar) then {
		d_player_can_call_drop = 1;
	};
	if (d_string_player in d_can_call_cas) then {
		d_player_can_call_cas = 1;
	};
};
player setUnitTrait ["explosiveSpecialist", true];

private _respawn_marker = "";
private _base_spawn_m = "base_spawn_1";
switch (d_own_side) do {
	case "GUER": {
		_respawn_marker = "respawn_guerrila";
		deleteMarkerLocal "respawn_west";
		deleteMarkerLocal "respawn_east";
	};
	case "WEST": {
		_respawn_marker = "respawn_west";
		deleteMarkerLocal "respawn_guerrila";
		deleteMarkerLocal "respawn_east";
	};
	case "EAST": {
		_respawn_marker = "respawn_east";
		deleteMarkerLocal "respawn_west";
		deleteMarkerLocal "respawn_guerrila";
#ifdef __TT__
		_base_spawn_m = "base_spawn_2";
		"base_spawn_1" setMarkerPosLocal markerPos _base_spawn_m;
#endif
	};
};

_respawn_marker setMarkerPosLocal markerPos _base_spawn_m;
#ifdef __IFA3LITE__
"respawn_guerrila" setMarkerPosLocal markerPos _base_spawn_m;
#endif

// special triggers for engineers, AI version, everybody can repair and flip vehicles
if (d_string_player in d_is_engineer || {!d_no_ai}) then {
	d_eng_can_repfuel = true;

	if (d_engineerfull == 0 || {!d_no_ai}) then {
#ifndef __TT__
		private _engineer_trigger = createTrigger ["EmptyDetector" ,d_base_array select 0, false];
		_engineer_trigger setTriggerArea [d_base_array select 1, d_base_array select 2, d_base_array select 3, true, 2];
#else
		private _mbase = if (d_player_side == blufor) then {d_base_array select 0} else {d_base_array select 1};
		private _engineer_trigger = createTrigger ["EmptyDetector" ,_mbase select 0, false];
		_engineer_trigger setTriggerArea [_mbase select 1, _mbase select 2, _mbase select 3, true, 2];
#endif
		_engineer_trigger setTriggerActivation [d_own_side, "PRESENT", true];
		_engineer_trigger setTriggerStatements["!d_eng_can_repfuel && {player in thislist}", "d_eng_can_repfuel = true;systemChat (localize 'STR_DOM_MISSIONSTRING_340')", ""];
	};

	if (d_with_ranked) then {d_last_base_repair = -1};

	["itemAdd", ["dom_eng_1_trig", {
		if (player getVariable ["d_has_ffunc_aid", -9999] == -9999 && {player call d_fnc_hastoolkit && {call d_fnc_ffunc}}) then {
			player setVariable ["d_has_ffunc_aid", player addAction [format ["<t color='#7F7F7F'>%1</t>", localize 'STR_DOM_MISSIONSTRING_1408'], {_this call d_fnc_unflipVehicle}, [d_objectID1], -1, false]];
		} else {
			if (player getVariable ["d_has_ffunc_aid", -9999] != -9999 && {!(call d_fnc_ffunc)}) then {
				player removeAction (player getVariable "d_has_ffunc_aid");
				player setVariable ["d_has_ffunc_aid", -9999];
			};
		};
	}, 0.51]] call bis_fnc_loop;

	if (d_engineerfull == 0 || {!d_no_ai}) then {
		player setVariable ["d_has_sfunc_aid", false];
		d_actionID2 = -9999;
		d_orig_sfunc_obj = objNull;
		["itemAdd", ["dom_eng_2_trig", {
			call d_fnc_engtrigfnc;
		}, 0.56]] call bis_fnc_loop;
	};

	player setVariable ["d_is_engineer", true];
	player setVariable ["d_farp_pos", []];

	if (d_engineerfull == 0 || {!d_no_ai}) then {
		{_x addAction [format ["<t color='#AAD9EF'>%1</t>", localize "STR_DOM_MISSIONSTRING_513"], {_this call d_fnc_restoreeng}];false} count d_farps;
	};
};

{
	_x addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_DOM_MISSIONSTRING_286a"], {_this call d_fnc_healatmash}, 0, -1, false, false, "", "damage player > 0 && {alive player && {!(player getVariable 'xr_pluncon') && {!(player getVariable ['ace_isunconscious', false]) && {!(player getVariable 'd_isinaction') && {!(player getVariable ['ace_isunconscious', false]) && {!(player getVariable ['ace_isunconscious', false])}}}}}}"];
	false
} count d_mashes;

{
	private _farpc = _x getVariable ["d_objcont", []];
	if !(_farpc isEqualTo []) then {
		private _trig = _farpc select 0;
		_trig setTriggerActivation ["ANY", "PRESENT", true];
		_trig setTriggerStatements ["thislist call d_fnc_tallservice", "0 = [thislist] spawn d_fnc_reload", ""];
	};
	false
} count d_farps;

#ifndef __TT__
// Enemy at base
"d_enemy_base" setMarkerPosLocal (d_base_array select 0);
"d_enemy_base" setMarkerDirLocal (d_base_array select 3);
[d_base_array select 0, [d_base_array select 1, d_base_array select 2, d_base_array select 3, true, 2], [d_enemy_side, "PRESENT", true], ["'Man' countType thislist > 0 || {'Tank' countType thislist > 0 || {'Car' countType thislist > 0}}", "[0] call d_fnc_BaseEnemies;'d_enemy_base' setMarkerSizeLocal [d_base_array select 1,d_base_array select 2];d_there_are_enemies_atbase = true", "[1] call d_fnc_BaseEnemies;'d_enemy_base' setMarkerSizeLocal [0,0];d_there_are_enemies_atbase = false"]] call d_fnc_createtriggerlocal;
[d_base_array select 0, [(d_base_array select 1) + 300, (d_base_array select 2) + 300, d_base_array select 3, true, 2], [d_enemy_side, "PRESENT", true], ["'Man' countType thislist > 0 || {'Tank' countType thislist > 0 || {'Car' countType thislist > 0}}", "if (!(player getVariable ['xr_pluncon', false]) && {!(player getVariable ['ace_isunconscious', false])}) then {hint (localize 'STR_DOM_MISSIONSTRING_1409')};d_enemies_near_base = true", "d_enemies_near_base = false"]] call d_fnc_createtriggerlocal;
#endif

if (player getUnitTrait "Medic") then {
	d_player_is_medic = true;
	player setVariable ["d_medtent", []];
};

d_x_loop_end = false;
if (d_WithMHQTeleport == 0) then {
#ifndef __TT__
	d_FLAG_BASE addAction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_533"], {_this call d_fnc_teleportx}];
#else
	private _base_flag = [d_EFLAG_BASE, d_WFLAG_BASE] select (d_player_side == blufor);
	_base_flag addAction [format ["<t color='#7F7F7F'>%1</t>", localize "STR_DOM_MISSIONSTRING_533"], {_this call d_fnc_teleportx}];
#endif
};

d_FLAG_BASE addaction [format ["<t color='#3F3F3F'>%1</t>", localize "STR_DOM_MISSIONSTRING_1745"], {_this call d_fnc_playerspectate}];

if (d_ParaAtBase == 1) then {
	"d_Teleporter" setMarkerTextLocal (localize "STR_DOM_MISSIONSTRING_534");
#ifdef __TT__
	"d_teleporter_1" setMarkerTextLocal (localize "STR_DOM_MISSIONSTRING_534");
#endif
};

if (!d_with_ace) then {
	0 spawn {
		// 0 = over head, 1 = cursor target
		d_show_pname_hud = d_playernames_state > 0 && {d_show_playernames == 0};

		d_show_player_namesx = d_playernames_state;

		d_dist_pname_hud = 250;

		sleep 10;

		waitUntil {sleep 0.232;!isNil "d_player_entities"};
		waitUntil {sleep 0.232;!d_still_in_intro};

		d_phudraw3d = -1;
		//d_pnhudgroupcolor = [0.96, 1, 0, 0.7];
		//d_pnhudothercolor = [0.86, 0.89, 0.1, 0.7];
		d_pnhudgroupcolor = [0, 1, 0, 0.9];
		d_pnhudothercolor = [1, 1, 1, 0.8];
		d_pnhuddeadcolor = [0, 0, 0, 0];

		d_pnhuddo2_prevCT = objNull;
		d_showPlayerNameRSC_shown = false;
		d_pnhuddo2_frskip = 0;

		if (d_show_pname_hud) then {
			d_phudraw3d = addMissionEventHandler ["Draw3D", {call d_fnc_player_name_huddo}];
		} else {
			["itemAdd", ["dom_player_hud2", {call d_fnc_player_name_huddo2}, 0]] call bis_fnc_loop;
		};
	};
};

private _primw = primaryWeapon player;
if (_primw != "") then {
	player selectWeapon _primw;
};

if (d_MissionType != 2) then {
	execFSM "fsms\fn_CampDialog.fsm";
	
	if (!isNil "d_searchbody" && {!isNull d_searchbody && {isNil {d_searchbody getVariable "d_search_id"}}}) then {
		call d_fnc_s_b_client;
	};
};

player setVariable ["d_p_f_b", 0];

player addEventHandler ["firedMan", {_this call d_fnc_playerfiredeh}];

if (d_no_3rd_person == 0) then {
	execFSM "fsms\fn_3rdperson.fsm";
};

d_mark_loc280 = localize "STR_DOM_MISSIONSTRING_280";
d_mark_loc261 = localize "STR_DOM_MISSIONSTRING_261";
d_mark_loc1825 = localize "STR_DOM_MISSIONSTRING_1825";

d_map_ameh = addMissionEventHandler ["Map", {
	if (param [0]) then {
		findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", {[_this, 0] call d_fnc_mapondraw}];
	};
	removeMissionEventHandler ["Map", d_map_ameh];
	d_map_ameh = nil;
}];

0 spawn d_fnc_waitforgps;
0 spawn d_fnc_waitartycompmap;
0 spawn d_fnc_waitforuavmap;

if (isNil "d_the_carrier") then {
	d_the_carrier = [0,0,0];
};

{
#ifdef __TT__
	if (_x select 2 == d_player_side) then {
#endif
	private _box = d_the_base_box createVehicleLocal [0,0,0];
	_box setDir (_x select 1);
	if (surfaceIsWater (_x select 0) && {_x select 0 distance2D d_the_carrier < 200 || {_x select 0 distance2D D_FLAG_BASE < 100}}) then {
		private _temppos = _x select 0;
		_temppos set [2, d_carrier_height];
		_box setPosASL _temppos;
	} else {
		_box setPos (_x select 0);
	};
	player reveal _box;
	[_box] call d_fnc_weaponcargo;
	[_box, _x] execFSM "fsms\fn_PlayerAmmobox.fsm";
#ifdef __TT__
	};
#endif
} forEach d_player_ammobox_pos;

(findDisplay 46) displayAddEventHandler ["MouseZChanged", {_this call d_fnc_MouseWheelRec}];

if (d_WithRevive == 0) then {
	call compile preprocessFileLineNumbers "x_revive.sqf";
};

0 spawn d_fnc_dcmcc;

(findDisplay 46) displayAddEventHandler ["KeyDown", {if (param [1] in actionKeys "TeamSwitch" && {alive player && {!(player getVariable "xr_pluncon") && {!(player getVariable ["ace_isunconscious", false]) && {!(param [2]) && {!(param [3]) && {!(param [4])}}}}}}) then {[0, _this] call d_fnc_KeyDownCommandingMenu; true} else {false}}];
(findDisplay 46) displayAddEventHandler ["KeyUp", {if (param [1] in actionKeys "TeamSwitch"&& {!(param [2]) && {!(param [3]) && {!(param [4])}}}) then {[1, _this] call d_fnc_KeyDownCommandingMenu; true} else {false}}];

// by R34P3R
d_p_isju = false;
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	if (param [1] in actionKeys "GetOver" &&  {alive player && {currentWeapon player == primaryWeapon player && {currentWeapon player != "" && {isNull objectParent player && {speed player > 11 && {stance player == "STAND" && {getFatigue player < 0.5 && {isTouchingGround (vehicle player) &&  {!(player getVariable ["xr_pluncon", false]) && {!(player getVariable ["ace_isunconscious", false]) && {!d_p_isju}}}}}}}}}}}) then {
		d_p_isju = true;
		0 spawn {
			private _v = velocity player;
			private _veloH = [(_v select 0) + 0.6, (_v select 1) + 0.6, (_v select 2) + 0.1];
			private _veloL = [_v select 0, _v select 1, (_v select 2) - 1];
			private _maxHight = (getPosATL player select 2) + 1.3;
			
			[player, "AovrPercMrunSrasWrflDf"] remoteExecCall ["switchMove"];
			sleep 0.05;
			while {animationState player == "AovrPercMrunSrasWrflDf"} do {
				if (getPosATL player select 2 > _maxHight) then {
					player setVelocity _veloL;
				} else {
					player setVelocity _veloH;
				};
				sleep 0.05;
			};
			sleep 1;
			d_p_isju = false;
		};
		true
	} else {
		false
	};
}];

d_vec_role_pl = [];
player addEventhandler ["getInMan", {
	d_player_in_base = false;
	d_vec_role_pl = assignedVehicleRole player;
	if (alive player && {!(player getVariable ["xr_pluncon", false]) && {!(player getVariable ["ace_isunconscious", false])}}) then {
		d_player_in_vec = true;
		_this call d_fnc_vehicleScripts;
	} else {
		d_player_in_vec = false;
	};
}];
player addEventhandler ["getOutMan", {
	d_player_in_vec = false;
	d_vec_role_pl = [];
	if (!isNil "d_heli_kh_ro") then {
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", d_heli_kh_ro];
		d_heli_kh_ro = nil;
	};
	if (getPos player select 2 > 5) then {
		d_player_in_air = true;
		0 spawn {
			while {alive player && {!(player getVariable ["xr_pluncon", false]) && {getPos player select 2 > 2 && {!(player getVariable ["ace_isunconscious", false])}}}} do {sleep 1};
			d_player_in_air = false;
#ifndef __TT__
			if (alive player && {!(player getVariable ["xr_pluncon", false]) && {!(player getVariable ["ace_isunconscious", false]) && {player inArea d_base_array && {!(player getVariable ["ace_isunconscious", false])}}}}) then {
#else
			if (alive player && {!(player getVariable ["xr_pluncon", false]) && {!(player getVariable ["ace_isunconscious", false]) && {player inArea (d_base_array select 0) || {player inArea (d_base_array select 1)}}}}) then {
#endif
				d_player_in_base = true;
			};			
		};
	} else {
#ifndef __TT__
		if (alive player && {!(player getVariable ["xr_pluncon", false]) && {!(player getVariable ["ace_isunconscious", false]) && {player inArea d_base_array}}}) then {
#else
		if (alive player && {!(player getVariable ["xr_pluncon", false]) && {!(player getVariable ["ace_isunconscious", false]) && {player inArea (d_base_array select 0) || {player inArea (d_base_array select 1)}}}}) then {
#endif
			d_player_in_base = true;
		};
	};
}];

d_pisadminp = false;
if (d_AutoKickTime == 0 || {d_with_ranked || {d_MissionType == 2}}) then {
	d_clientScriptsAr set [1, true];
};

["itemAdd", ["dom_cl_scripts_x", {call d_fnc_startClientScripts}, 0.6]] call bis_fnc_loop;

#ifdef __TT__
if (d_player_side == blufor) then {
#endif
if !(markerPos "d_runwaymarker" isEqualTo [0,0,0]) then {
	private _msize = markerSize "d_runwaymarker";
	[[markerPos "d_runwaymarker" select 0, markerPos "d_runwaymarker" select 1, 1.9], [_msize select 0, _msize select 1, markerDir "d_runwaymarker", true, 2], ["ANY", "PRESENT", true], ["!((thislist unitsBelowHeight 1) isEqualTo [])", "'d_runwaymarker' setMarkerColorLocal 'ColorRed'", "'d_runwaymarker' setMarkerColorLocal 'ColorGreen'"]] call d_fnc_createtriggerlocal;
};
#ifdef __TT__
};
if (d_player_side == opfor && {!(markerPos "d_runwaymarker_o" isEqualTo [0,0,0])}) then {
	private _msize = markerSize "d_runwaymarker_o";
	[[markerPos "d_runwaymarker_o" select 0, markerPos "d_runwaymarker_o" select 1, 1.9], [_msize select 0, _msize select 1, markerDir "d_runwaymarker_o", true, 2], ["ANY", "PRESENT", true], ["!((thislist unitsBelowHeight 1) isEqualTo [])", "'d_runwaymarker_o' setMarkerColorLocal 'ColorRed'", "'d_runwaymarker_o' setMarkerColorLocal 'ColorGreen'"]] call d_fnc_createtriggerlocal;
};
#endif

player call d_fnc_removenvgoggles_fak;
#ifndef __IFA3LITE__
if (d_without_nvg == 1 && {!(player call d_fnc_hasnvgoggles)}) then {
	player linkItem (switch (d_player_side) do {
		case opfor: {"NVGoggles_OPFOR"};
		case independent: {"NVGoggles_INDEP"};
		default {"NVGoggles"};
	});
};
#endif

#ifndef __IFA3LITE__
private _bino = binocular player;
if (d_string_player in d_can_use_artillery || {d_string_player in d_can_mark_artillery || {d_string_player in d_can_call_cas}}) then {
	if (_bino != "LaserDesignator") then {
		if (_bino != "") then {
			player removeWeapon _bino;
		};
		player addWeapon "LaserDesignator";
	};
	if !("Laserbatteries" in magazines player) then {
		player addMagazine ["Laserbatteries", 1];
	};
} else {
	if (_bino == "") then {
		player addWeapon "Binocular";
	};
};
if !("ItemGPS" in (assignedItems player)) then {
	player linkItem "ItemGPS";
};
#else
if !("ItemRadio" in assigneditems player) then {player linkItem "ItemRadio"};
#endif

call d_fnc_save_respawngear;
call d_fnc_save_layoutgear;

#ifndef __IFA3LITE__
if (sunOrMoon < 0.99 && {d_without_nvg == 1}) then {player action ["NVGoggles", player]};
#endif

["itemAdd", ["dom_clean_craters", {["itemRemove", ["dom_clean_craters"]] call bis_fnc_loop; 0 spawn d_fnc_clean_craters}, 240 + random 240]] call bis_fnc_loop;

private _fnc_artvec = {
	params ["_num", "_name"];
	{
		d_ao_arty_vecs pushBack _x;
		d_areArtyVecsAvailable = true;
		false
	} count (vehicles select {(str _x) select [0, _num] == _name});
};
#ifndef __TT__
[10, "d_artyvec_"] call _fnc_artvec;
#else
[11, ["d_artyvecb_%1", "d_artyveco_%1"] select (d_player_side == opfor)] call _fnc_artvec;
#endif

if (!d_no_ai || {d_string_player in d_can_use_artillery || {d_string_player in d_can_mark_artillery}}) then {
#ifndef __IFA3LITE__
	player setVariable ["d_ld_action", player addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_DOM_MISSIONSTRING_1520"], {_this call d_fnc_mark_artillery} , 0, 9, true, false, "", "alive player && {!(player getVariable ['xr_pluncon', false]) && {!(player getVariable ['ace_isunconscious', false]) && {!(player getVariable ['d_isinaction', false]) && {!d_player_in_vec && {cameraView == 'GUNNER' && {!isNull (laserTarget player) && {currentWeapon player isKindOf ['LaserDesignator', configFile >> 'CfgWeapons']}}}}}}}"]];
#else
	player setVariable ["d_ld_action", player addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_DOM_MISSIONSTRING_1520"], {_this call d_fnc_mark_artillery} , 0, 9, true, false, "", "alive player && {!(player getVariable ['xr_pluncon', false]) && {!(player getVariable ['ace_isunconscious', false]) && {!(player getVariable ['d_isinaction', false]) && {!d_player_in_vec && {cameraView == 'GUNNER' && {currentWeapon player isKindOf ['Binocular', configFile >> 'CfgWeapons']}}}}}}"]];
#endif
};

if (!d_no_ai || {d_string_player in d_can_call_cas}) then {
#ifndef __TT__
	if (!d_ifa3lite) then {
		player setVariable ["d_ccas_action", player addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_DOM_MISSIONSTRING_1711"], {_this call d_fnc_call_cas} , 0, 9, true, false, "", "d_cas_available && {alive player && {!(player getVariable ['xr_pluncon', false]) && {!(player getVariable ['ace_isunconscious', false]) && {!(player getVariable ['d_isinaction', false]) && {!d_player_in_vec && {cameraView == 'GUNNER' && {!isNull (laserTarget player) && {!((laserTarget player) inArea d_base_array) && {currentWeapon player isKindOf ['LaserDesignator', configFile >> 'CfgWeapons']}}}}}}}}}"]];
	} else {
		player setVariable ["d_ccas_action", player addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_DOM_MISSIONSTRING_1711"], {_this call d_fnc_call_cas} , 0, 9, true, false, "", "d_cas_available && {alive player && {!(player getVariable ['xr_pluncon', false]) && {!(player getVariable ['ace_isunconscious', false]) && {!(player getVariable ['d_isinaction', false]) && {!d_player_in_vec && {cameraView == 'GUNNER' && {!(screenToWorld [0.5, 0.5] inArea d_base_array) && {currentWeapon player isKindOf ['Binocular', configFile >> 'CfgWeapons']}}}}}}}}"]];
	};
#else
	if (d_player_side == blufor) then {
		player setVariable ["d_ccas_action", player addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_DOM_MISSIONSTRING_1711"], {_this call d_fnc_call_cas} , 0, 9, true, false, "", "d_cas_available_w && {alive player && {!(player getVariable ['xr_pluncon', false]) && {!(player getVariable ['ace_isunconscious', false]) && {!(player getVariable ['d_isinaction', false]) && {!d_player_in_vec && {cameraView == 'GUNNER' && {!isNull (laserTarget player) && {!((laserTarget player) inArea (d_base_array select 0)) && {currentWeapon player isKindOf ['LaserDesignator', configFile >> 'CfgWeapons']}}}}}}}}}"]];
	} else {
		player setVariable ["d_ccas_action", player addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_DOM_MISSIONSTRING_1711"], {_this call d_fnc_call_cas} , 0, 9, true, false, "", "d_cas_available_e && {alive player && {!(player getVariable ['xr_pluncon', false]) && {!(player getVariable ['ace_isunconscious', false]) && {!(player getVariable ['d_isinaction', false]) && {!d_player_in_vec && {cameraView == 'GUNNER' && {!isNull (laserTarget player) && {!((laserTarget player) inArea (d_base_array select 0)) && {currentWeapon player isKindOf ['LaserDesignator', configFile >> 'CfgWeapons']}}}}}}}}}"]];
	};
#endif
};

player addEventhandler["InventoryOpened", {_this call d_fnc_inventoryopened}];

[missionNamespace, "arsenalOpened", {
	disableSerialization;
	if (sunOrMoon < 0.9) then {
		d_arsenal_nvg_used = true;
		camUseNVG true;
	};
	params ["_disp"];
	(_disp displayCtrl 44150) ctrlEnable false; // random
	(_disp displayCtrl 44148) ctrlEnable false; // export
	(_disp displayCtrl 44149) ctrlEnable false; // import
	(_disp displayCtrl 44151) ctrlEnable false; // hide
	_disp displayAddEventHandler ["KeyDown", {(_this select 1) in [19, 29]}];
	if (d_with_ranked) then {
		(_disp displayCtrl 44147) ctrlEnable false; // Load
		(_disp displayCtrl 44146) ctrlEnable false; // Save
		_disp displayAddEventHandler ["KeyDown", {
			_this select 3 && {_this select 1 == DIK_O}
		}];
	};
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "arsenalClosed", {
	call d_fnc_save_respawngear;
	call d_fnc_save_layoutgear;
	[player, getUnitLoadout player, d_player_side] remoteExecCall ["d_fnc_storeploadout", 2];
	if (!isNil "d_arsenal_nvg_used") then {
		d_arsenal_nvg_used = nil;
		camUseNVG false;
	};
	if (d_with_ranked) then {
		call d_fnc_store_rwitems;
	};
}] call BIS_fnc_addScriptedEventHandler;

player addEventhandler ["HandleRating", {
	if (param [1] < 0) then {0} else {param [1]}
}];

d_pisadminp = false;
addMissionEventhandler ["EachFrame", {call d_fnc_SCACheck}];

if (d_enablefatigue == 0) then {
	player setFatigue 0;
	player enableFatigue false;
};

if (d_enablesway == 0) then {
	player setCustomAimCoef 0.1;
};

player setVariable ["xr_isleader", false];
0 spawn {
	sleep 10;
	private _islead = leader (group player) == player;
	player setVariable ["xr_isleader", _islead];
	if (_islead) then {
		{
			[_x, ["xr_isleader", false]] remoteExecCall ["setVariable", _x];
			false
		} count ((units (group player)) - [player]);
	};
};

player addEventhandler ["WeaponAssembled", {
	["aw", d_string_player, param [1]] remoteExecCall ["d_fnc_p_o_ar", 2];
}];

{_x call d_fnc_initvec; false} count vehicles;

["Preload"] call bis_fnc_arsenal;

d_arsenal_own_side_only = true;

if (d_ifa3lite) then {
	["WW2_"] call d_fnc_arsenal_mod;
} else {
	private _arsar = [];
	if (d_with_ace) then {
		_arsar pushBack "ace_";
	};
	if (d_cup) then {
		_arsar pushBack "CUP_";
	} else {
		if (d_rhs) then {
			_arsar append ["rhs_", "rhsgref_", "rhsusf_", "rhssaf_"];
		};
	};
	if !(_arsar isEqualTo []) then {
		_arsar call d_fnc_arsenal_mod;
	};
};

missionNamespace setVariable ["BIS_dynamicGroups_allowInterface", false];

if (d_with_ace) then {
	addMissionEventHandler ["Draw3D", {
		if (alive player && {!(player getVariable ["ace_isunconscious", false])}) then {
			{
				private _u = missionNamespace getVariable _x;
				if (!isNil "_u" && {!isNull _u && {_u getVariable ["ace_isunconscious", false]}}) then {
					private _dist = (positionCameraToWorld [0,0,0]) distance _u;
					if (_dist < 400) then {
						private _pos = getPosATLVisual _u;
						_pos set [2, (_pos select 2) + 1 + (_dist * 0.05)];
						drawIcon3D ["\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa", [1,0,0,1 - (_dist / 200)], _pos, 1, 1, 0, "(Uncon) " + (_u call d_fnc_getplayername), 1, 0.032 - (_dist / 9000), "RobotoCondensed"];
					};
				};
				false
			} count d_player_entities;
		};
	}];
};

#ifndef __TT__
d_last_placed_zeus_obj = objNull;
{
	_x addEventhandler ["CuratorObjectPlaced", {
		addToRemainsCollector [param [1]];
	}];
	false
} count allCurators;
#endif

0 spawn {
	waitUntil {sleep 0.3;time > 0};
	enableEnvironment [false, true];
};

if (isMultiplayer) then {
	execVM "x_client\x_intro.sqf";
} else {
	{_x enableSimulation false;false} count (switchableUnits select {_x != player});
};

diag_log [diag_frameno, diag_ticktime, time, "Dom x_setupplayer.sqf processed"];
