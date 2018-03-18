// by Xeno
//#define __DEBUG__
diag_log [diag_frameno, diag_ticktime, time, "Executing Dom d_init.sqf"];
#define THIS_FILE "d_init.sqf"
#include "x_setup.sqf"

if (!isServer) then {
	call compile preprocessFileLineNumbers "x_init\x_initcommon.sqf";
};

#ifdef __GROUPDEBUG__
call compile preprocessFileLineNumbers "x_shc\x_f\x_shcfunctions.sqf";
#endif

setViewDistance d_InitialViewDistance;
setObjectViewDistance (d_InitialViewDistance + 100);

d_target_names = [];
{
	private _dtar = _x;

	private _ar = [];
	_ar resize 3;
	private _name = _dtar getVariable "d_cityname";
	if (!isNil "_name") then {
		private _pos = getPosWorld _dtar;
		_pos set [2, 0];
		_ar set [0, _pos]; // position CityCenter by logic
		_ar set [1, _name]; // name village/city
		_ar set [2, _dtar getVariable ["d_cityradius", 300]];
		__TRACE_1("One target found","_ar")
		d_target_names pushBack _ar;
	} else {
		private _nlocs = nearestLocations [getPosWorld _dtar, ["NameCityCapital", "NameCity", "NameVillage"], 500];
		__TRACE_2("","_dtar","_nlocs")
		if !(_nlocs isEqualTo []) then {
			private _locposnl0 = locationPosition (_nlocs select 0);
			private _nl = nearestLocations [_locposnl0, ["CityCenter"], 300];
			__TRACE_2("","_locposnl0","_nl")
			private _pos = [_locposnl0, locationPosition (_nl select 0)] select !(_nl isEqualTo []);
			_pos set [2, 0];
			_ar set [0, _pos]; // position CityCenter
			if (isServer) then {
				_dtar setPos _pos;
			};
			_name = text (_nlocs select 0);
			_ar set [1, _name]; // name village/city
			_ar set [2, _dtar getVariable ["d_cityradius", 300]];
			_dtar setVariable ["d_cityname", _name];
			__TRACE_1("One target found","_ar")
			d_target_names pushBack _ar;
		} else {
			private _strx = "No city found near target location " + format ["d_target_%1", _i];
			hint _strx;
			diag_log _strx;
		};
	};
	if (isServer) then {
		_dtar enableSimulationGlobal false;
	};
} count ((allMissionObjects "LocationCityCapital_F") select {str _x select [0, 9] == "d_target_"});
__TRACE_1("All targets found","d_target_names")

// positions of service buildings
// first jet service, second chopper service, third wreck repair

d_service_buildings = [[], [], []];
#ifndef __TT__
if (!d_ifa3lite) then {
	if !(markerPos "d_base_jet_sb" isEqualTo [0,0,0]) then {
		d_service_buildings set [0, [markerPos "d_base_jet_sb", markerDir "d_base_jet_sb"]];
	};
	if !(markerPos "d_base_chopper_sb" isEqualTo [0,0,0]) then {
		d_service_buildings set [1, [markerPos "d_base_chopper_sb", markerDir "d_base_chopper_sb"]];
	};
	if !(markerPos "d_base_wreck_sb" isEqualTo [0,0,0]) then {
		d_service_buildings set [2, [markerPos "d_base_wreck_sb", markerDir "d_base_wreck_sb"]];
	};
};
d_FLAG_BASE allowDamage false;
if (isServer) then {
	if (!d_ifa3lite) then {
		deleteMarker "d_base_jet_sb";
		deleteMarker "d_base_chopper_sb";
	};
	deleteMarker "d_base_wreck_sb";
	d_FLAG_BASE enableSimulationGlobal false;
};

// position base, side a and b length, direction and circle (false)/rectangle(true), like trigger; for the enemy at base area and marker
"d_base_marker" setMarkerAlphaLocal 0;
private _msize = markerSize "d_base_marker";
d_base_array = [[markerPos "d_base_marker" select 0, markerPos "d_base_marker" select 1, 1.9], _msize select 0, _msize select 1, markerDir "d_base_marker", true];

// position of anti air at own base
d_base_anti_air1 = markerPos "d_base_anti_air1";
d_base_anti_air2 = markerPos "d_base_anti_air2";
#else
d_EFLAG_BASE allowDamage false;
d_WFLAG_BASE allowDamage false;
if (isServer) then {
	d_EFLAG_BASE enableSimulationGlobal false;
	d_WFLAG_BASE enableSimulationGlobal false;
};

"d_base_marker_w" setMarkerAlphaLocal 0;
"d_base_marker_e" setMarkerAlphaLocal 0;
private _msize = markerSize "d_base_marker_w";
private _msize2 = markerSize "d_base_marker_e";
d_base_array = [
	[[markerPos "d_base_marker_w" select 0, markerPos "d_base_marker_w" select 1, 1.9], _msize select 0, _msize select 1, markerDir "d_base_marker_w", true], // blufor
	[[markerPos "d_base_marker_e" select 0, markerPos "d_base_marker_e" select 1, 1.9], _msize2 select 0, _msize2 select 1, markerDir "d_base_marker_e", true] // opfor
];
#endif
if (isServer) then {
	0 spawn d_fnc_d_flag_base_correct;
};

"d_isledefense_marker" setMarkerAlphaLocal 0;

if (isServer) then {
#include "i_server.sqf"
};

if (d_with_dynsim == 0) then {
	enableDynamicSimulationSystem true;
	"Group" setDynamicSimulationDistance 1000;
	"Vehicle" setDynamicSimulationDistance 3000;
	"EmptyVehicle" setDynamicSimulationDistance 1000;
	"Prop" setDynamicSimulationDistance 1000;
	"IsMoving" setDynamicSimulationDistanceCoef 2;
} else {
	enableDynamicSimulationSystem false;
};

if (hasInterface) then {
	// marker position of the player ammobox at base and other player ammoboxes (marker always needs to start with d_player_ammobox_pos)
	// note, in the TT version add the side to the array too
#ifndef __TT__
	d_player_ammobox_pos = [];
	{
		d_player_ammobox_pos pushBack [markerPos _x, markerDir _x];
		false
	} count (allMapMarkers select {_x select [0, 20] == "d_player_ammobox_pos"});
#else
	d_player_ammobox_pos = [
		[markerPos "d_player_ammobox_pos", markerDir "d_player_ammobox_pos", west],
		[markerPos "d_player_ammobox_pos_e", markerDir "d_player_ammobox_pos_e", east]
	];
#endif

	{
		deleteMarkerLocal _x;
		false
	} count (allMapMarkers select {_x select [0, 20] == "d_player_ammobox_pos"});
};

if (isDedicated && {d_WithRevive == 0}) then {
	call compile preprocessFileLineNumbers "x_revive.sqf";
};

#include "x_missions\x_missionssetup.sqf"

#ifndef __TT__
{_x allowDamage false;false} count (nearestTerrainObjects [d_FLAG_BASE, ["House"], 70, false, true]);
#else
{_x allowDamage false;false} count (nearestTerrainObjects [d_EFLAG_BASE, ["House"], 70, false, true]);
{_x allowDamage false;false} count (nearestTerrainObjects [d_WFLAG_BASE, ["House"], 70, false, true]);
#endif

if (isNil "d_target_clear") then {
	d_target_clear = false;
};
if (isNil "d_all_sm_res") then {
	d_all_sm_res = false;
};
if (isNil "d_the_end") then {
	d_the_end = false;
};
#ifndef __TT__
if (isNil "d_ari_available") then {
	d_ari_available = true;
};
#else
if (isNil "d_ari_available_w") then {
	d_ari_available_w = true;
};
if (isNil "d_ari_available_e") then {
	d_ari_available_e = true;
};
#endif
if (isNil "d_current_target_index") then {
	d_current_target_index = -1;
};
if (isNil "d_cur_sm_idx") then {
	d_cur_sm_idx = -1;
};
if (isNil "d_num_ammo_boxes") then {
	d_num_ammo_boxes = 0;
};
if (isNil "d_sec_kind") then {
	d_sec_kind = 0;
};
if (isNil "d_resolved_targets") then {
	d_resolved_targets = [];
};
if (isNil "d_ammo_boxes") then {
	d_ammo_boxes = [];
};
if (isNil "d_para_available") then {
	d_para_available = true;
};
if (isNil "d_searchbody") then {
	d_searchbody = objNull;
};
if (isNil "d_searchintel") then {
	d_searchintel = [0,0,0,0,0,0];
};
#ifndef __TT__
if (isNil "d_ari_blocked") then {
	d_ari_blocked = false;
};
#else
if (isNil "d_ari_blocked_w") then {
	d_ari_blocked_w = false;
};
if (isNil "d_ari_blocked_e") then {
	d_ari_blocked_e = false;
};
#endif
if (!d_no_ai && {isNil "d_drop_blocked"}) then {
	d_drop_blocked = false;
};
if (isNil "d_numcamps") then {
	d_numcamps = 0;
};
#ifndef __TT__
if (isNil "d_campscaptured") then {
	d_campscaptured = 0;
};
#else
if (isNil "d_campscaptured_w") then {
	d_campscaptured_w = 0;
};
if (isNil "d_campscaptured_e") then {
	d_campscaptured_e = 0;
};
#endif
if (isNil "d_farps") then {
	d_farps = [];
};
if (isNil "d_mashes") then {
	d_mashes = [];
};
if (isNil "d_cur_tgt_pos") then {
	d_cur_tgt_pos = [];
};
if (isNil "d_cur_tgt_name") then {
	d_cur_tgt_name = "";
};
if (isNil "d_cur_target_radius") then {
	d_cur_target_radius = -1;
};
if (isNil "d_mttarget_radius_patrol") then {
	d_mttarget_radius_patrol = -1;
};
#ifndef __TT__
if (isNil "d_cas_available") then {
	d_cas_available = true;
};
#else
if (isNil "d_cas_available_w") then {
	d_cas_available_w = true;
};
if (isNil "d_cas_available_e") then {
	d_cas_available_e = true;
};
#endif
if (isNil "d_winterw") then {
	d_winterw = 0;
};

if (isServer) then {
	execVM "x_bikb\kbinit.sqf";

	call compile preprocessFileLineNumbers "x_shc\x_shcinit.sqf";

#ifndef __TT__
	0 spawn {
		scriptName "spawn_x_initx_createbase";
		waitUntil {time > 0};
		sleep 2;

		private _mmm = markerPos "d_base_sb_ammoload";
		__TRACE_1("","_mmm")

		if !(_mmm isEqualTo [0,0,0]) then {
			private _stype = [d_servicepoint_building] call BIS_fnc_simpleObjectData;
			_mmm set [2, 3.3];
			private _fac = createSimpleObject [_stype select 1, _mmm];
			_fac setDir (markerDir "d_base_sb_ammoload");
			_fac setPos _mmm;
		};

		if (d_base_aa_vec == "") exitWith {};

		if (isNil "d_HC_CLIENT_OBJ_OWNER") then {
			[d_own_side, d_base_aa_vec] call d_fnc_cgraa;
		} else {
			[d_own_side, d_base_aa_vec] remoteExecCall ["d_fnc_cgraa", d_HC_CLIENT_OBJ_OWNER];
		};
	};
#endif

	if (d_weather == 0) then {execFSM "fsms\fn_WeatherServer.fsm"};

	if (d_MainTargets_num < 200) then {
#ifdef __TANOATT__
		if (d_MainTargets_num > 21) then {
			d_MainTargets_num = 21;
		};
#endif
		d_MainTargets = d_MainTargets_num;
		// create random list of targets
		d_maintargets_list = call d_fnc_createrandomtargets;
		//d_maintargets_list = [0,1,2,3];
		__TRACE_1("","d_maintargets_list")
	} else {
#ifdef __ALTIS__
		switch (d_MainTargets_num) do {
			case 200: {d_maintargets_list = [3,16,17,18,20,19,9,8,7,5,10,15]};
			case 210: {d_maintargets_list = [0,32,13,14,12,11]};
			case 220: {d_maintargets_list = [2,27,29,28,30,31]};
			case 230: {d_maintargets_list = [6,26,1,25,24,21,22,23]};
			case 240: {d_maintargets_list = [3,16,17,20,18,19,9,8,7,5,6,10,15,4,14,11,12,13,0,32,2,33,26,1,23,22,21,24,25,28,29,30,31]};
		};
#endif
#ifdef __CUP_CHERNARUS__
		switch (d_MainTargets_num) do {
			case 200: {d_maintargets_list = [6,14,17,18,0,13,19]};
			case 210: {d_maintargets_list = [5,7,1,16,2]};
			case 220: {d_maintargets_list = [20,3,15,4,9,10,8,11]};
			case 230: {d_maintargets_list = [6,14,5,17,18,0,13,19,1,7,16,2,12,11,8,10,9,4,15,3,20]};
		};
#endif
#ifdef __CUP_TAKISTAN__
		switch (d_MainTargets_num) do {
			case 200: {d_maintargets_list = [14,16,12,11,20,19,17,1,0]};
			case 210: {d_maintargets_list = [14,10,9,8,3,2]};
			case 220: {d_maintargets_list = [15,13,7,6,18,5,4,2]};
			case 230: {d_maintargets_list = [14,16,10,20,11,12,19,17,1,0,2,3,8,9,13,15,7,6,18,5,4]};
		};
#endif
#ifdef __STRATIS__
		switch (d_MainTargets_num) do {
			case 200: {d_maintargets_list = [14,16,12,11,20,19,17,1,0]};
			case 210: {d_maintargets_list = [14,10,9,8,3,2]};
			case 220: {d_maintargets_list = [15,13,7,6,18,5,4,2]};
			case 230: {d_maintargets_list = [14,16,10,20,11,12,19,17,1,0,2,3,8,9,13,15,7,6,18,5,4]};
		};
#endif
		d_MainTargets = count d_maintargets_list;
	};
	publicVariable "d_MainTargets";

	// create random list of side missions
	d_side_missions_random = d_sm_array call d_fnc_RandomArray;
	__TRACE_1("","d_side_missions_random")

	d_current_mission_counter = 0;

/* #ifndef __TT__
	// editor varname, unique number, true = respawn only when the chopper is completely destroyed, false = respawn after some time when no crew is in the chopper or chopper is destroyed
	// unique number must be between 3000 and 3999
	if (!d_ifa3lite) then {
		[[d_chopper_1,3001,true],[d_chopper_2,3002,true],[d_chopper_3,3003,false,1500],[d_chopper_4,3004,false,1500],[d_chopper_5,3005,false,600],[d_chopper_6,3006,false,600]] call compile preprocessFileLineNumbers "x_server\x_inithelirespawn2.sqf";
	};
	// editor varname, unique number
	//0-99 = MHQ, 100-199 = Medic vehicles, 200-299 = Fuel, Repair, Reammo trucks, 300-399 = Engineer Salvage trucks, 400-499 = Transport trucks
	// new in 3.70  third parameter for MHQ means a message will be displayed for a MHQ if it gets destroyed
	private _var = [
		[d_vec_mhq_1,0,localize "STR_DOM_MISSIONSTRING_12"],[d_vec_mhq_2,1, localize "STR_DOM_MISSIONSTRING_13"],[d_vec_med_1,100],[d_vec_rep_1,200],[d_vec_fuel_1,201],[d_vec_ammo_1,202], [d_vec_rep_2,203],
		[d_vec_fuel_2,204], [d_vec_ammo_2,205], [d_vec_eng_1,300], [d_vec_eng_2,301], [d_vec_trans_1,400], [d_vec_trans_2,401]
	];
	if (d_ifa3lite) then {
		_var pushBack [d_vec_wreck_1,500];
	};
	_var call compile preprocessFileLineNumbers "x_server\x_initvrespawn2.sqf";
	if (!isNil "d_boat_1") then {
		execFSM "fsms\fn_Boatrespawn.fsm";
	};
#else
	[[d_chopper_1,3001,true],[d_chopper_2,3002,true],[d_chopper_3,3003,false,1500],[d_chopper_4,3004,false,1500],[d_chopper_5,3005,false,600],[d_chopper_6,3006,false,600],
	[d_choppero_1,4001,true],[d_choppero_2,4002,true],[d_choppero_3,4003,false,1500],[d_choppero_4,4004,false,1500],[d_choppero_5,4005,false,600],[d_choppero_6,4006,false,600]] call compile preprocessFileLineNumbers "x_server\x_inithelirespawn2.sqf";

	[
		[d_vec_mhq_1,0,localize "STR_DOM_MISSIONSTRING_12"],[d_vec_mhq_2,1,localize "STR_DOM_MISSIONSTRING_13"],[d_vec_med_1,100],[d_vec_rep_1,200],[d_vec_fuel_1,201],[d_vec_ammo_1,202], [d_vec_rep_2,203],
		[d_vec_fuel_2,204], [d_vec_ammo_2,205], [d_vec_eng_1,300], [d_vec_eng_2,301], [d_vec_trans_1,400], [d_vec_trans_2,401],
		[d_vec_mhqo_1,1000,localize "STR_DOM_MISSIONSTRING_12"],[d_vec_mhqo_2,1001,localize "STR_DOM_MISSIONSTRING_13"],[d_vec_medo_1,1100],[d_vec_repo_1,1200],[d_vec_fuelo_1,1201],[d_vec_ammoo_1,1202], [d_vec_repo_2,1203],
		[d_vec_fuelo_2,1204], [d_vec_ammoo_2,1205], [d_vec_engo_1,1300], [d_vec_engo_2,1301], [d_vec_transo_1,1400], [d_vec_transo_2,1401]
	] call compile preprocessFileLineNumbers "x_server\x_initvrespawn2.sqf";
#endif
	[d_wreck_rep,localize "STR_DOM_MISSIONSTRING_0",d_heli_wreck_lift_types] execFSM "fsms\fn_RepWreck.fsm"; */
#ifdef __TT__
	/* [d_wreck_rep2, localize "STR_DOM_MISSIONSTRING_0", d_heli_wreck_lift_types] execFSM "fsms\fn_RepWreck.fsm"; */
	d_public_points = true;
#endif

	call compile preprocessFileLineNumbers "x_server\x_setupserver.sqf";
	if (d_MissionType != 2) then {0 spawn d_fnc_createnexttarget};

#ifdef __TT__
	d_points_blufor = 0;
	d_points_opfor = 0;
	d_kill_points_blufor = 0;
	d_kill_points_opfor = 0;
	d_points_array = [0,0,0,0];
	publicVariable "d_points_array";
#endif

	addMissionEventHandler ["PlayerDisconnected", {_this call d_fnc_playerdisconnected}];

	addMissionEventHandler ["HandleDisconnect", {_this call d_fnc_handledisconnect}];

	addMissionEventhandler ["BuildingChanged", {_this call d_fnc_buildingchanged}];
};

if (hasInterface) then {
#ifndef __TT__
	["d_wreck_service", d_wreck_rep,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_0",0,"n_service"] call d_fnc_CreateMarkerLocal;
	["d_aircraft_service", d_jet_trigger,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_2",0,"n_service"] call d_fnc_CreateMarkerLocal;
	if (!d_ifa3lite) then {
		["d_chopper_service", d_chopper_trigger,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_3",0,"n_service"] call d_fnc_CreateMarkerLocal;
	};
	["d_vec_service", d_vecre_trigger,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_4",0,"n_service"] call d_fnc_CreateMarkerLocal;
	["d_Ammobox_Reload", d_AMMOLOAD,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_5",0,"hd_dot"] call d_fnc_CreateMarkerLocal;
	["d_teleporter", d_FLAG_BASE,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_6",0,"mil_flag"] call d_fnc_CreateMarkerLocal;
	if (d_carrier) then {
		["d_Ammobox_Reload_C", d_AMMOLOAD_C,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_5",0,"hd_dot"] call d_fnc_CreateMarkerLocal;
		["d_service_point", d_serviceall_trigger,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_1761",0,"hd_dot"] call d_fnc_CreateMarkerLocal;
	};
#else
	["d_wreck_service", d_wreck_rep,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_0",0,"n_service"] call d_fnc_CreateMarkerLocal;
	["d_aircraft_service", d_jet_trigger,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_2",0,"n_service"] call d_fnc_CreateMarkerLocal;
	if (!d_ifa3lite) then {
		["d_chopper_service", d_chopper_trigger,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_3",0,"n_service"] call d_fnc_CreateMarkerLocal;
	};
	["d_vec_service", d_vecre_trigger,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_4",0,"n_service"] call d_fnc_CreateMarkerLocal;
	["d_Ammobox_Reload", d_AMMOLOAD,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_5",0,"hd_dot"] call d_fnc_CreateMarkerLocal;
	["d_teleporter", d_WFLAG_BASE,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_6",0,"mil_flag"] call d_fnc_CreateMarkerLocal;

	["d_wreck_serviceR", d_wreck_rep2,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_0",0,"n_service"] call d_fnc_CreateMarkerLocal;
	["d_aircraft_serviceR", d_jet_trigger2,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_2",0,"n_service"] call d_fnc_CreateMarkerLocal;
	["d_chopper_serviceR", d_chopper_triggerR,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_3",0,"n_service"] call d_fnc_CreateMarkerLocal;
	["d_vehicle_serviceR", d_vecre_trigger2,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_4",0,"n_service"] call d_fnc_CreateMarkerLocal;
	["d_Ammobox ReloadR", d_AMMOLOAD2,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_5",0,"hd_dot"] call d_fnc_CreateMarkerLocal;
	["d_teleporter_1", d_EFLAG_BASE,"ICON","ColorYellow",[1,1],localize "STR_DOM_MISSIONSTRING_6",0,"mil_flag"] call d_fnc_CreateMarkerLocal;
	{
		_x setMarkerAlphaLocal 0;
		false
	} count ["d_chopper_service","d_wreck_service","d_teleporter","d_aircraft_service","bonus_air","bonus_vehicles","d_Ammobox_Reload","d_vec_service",
		"Start","d_chopper_serviceR","d_wreck_serviceR","d_teleporter_1","d_aircraft_serviceR","bonus_airR","bonus_vehiclesR","d_Ammobox ReloadR","Start_opfor","d_vehicle_serviceR", "d_runwaymarker_o", "d_runwaymarker"];
#endif

	private _icounter = 1;
	{
		private _name = str _x;
		if (_name select [0, 9] == "d_flag_bb") then {
			d_additional_respawn_points pushBack ["d_add_farp_" + str _icounter, _name, localize "STR_DOM_MISSIONSTRING_1762" + " " + str _icounter, blufor, true];
			_icounter = _icounter + 1;
		};
	} count (allMissionObjects "FlagCarrier");
	{
		d_add_resp_points_uni pushBack (_x select 0);
		false
	} count d_additional_respawn_points;

	call compile preprocessFileLineNumbers "i_weapons.sqf";
};

d_init_processed = true;

diag_log [diag_frameno, diag_ticktime, time, "Dom d_init.sqf processed"];
