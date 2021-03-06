//#define __DEBUG__
#define THIS_FILE "x_m143.sqf"
#include "x_setup.sqf"
private ["_trigger", "_cm", "_endtime", "_ran", "_i", "_newgroup", "_units", "_leader"];

GVAR(x_sm_pos) = QGVAR(sm_143) call FUNC(smmapos); //  destroy lost uav
GVAR(x_sm_type) = "normal"; // "convoy"

#ifdef __SMMISSIONS_MARKER__
if (true) exitWith {};
#endif

if (!isDedicated) then {
	GVAR(cur_sm_txt) = (localize "STR_DOM_SIDESTRING_1057");
	GVAR(cur_sm_res_txt) = (localize "STR_DOM_SIDESTRING_1058");
};

if (isServer) then {
	_trigger = objNull;
	__Poss
	_exact_pos = [_poss, 300] call FUNC(GetRanPointCircleOld);
	_cm = createVehicle [selectRandom GVAR(sm_uav), _exact_pos, [], 0, "NONE"];
	_cm allowDamage false;
	_cm setDir (random 360);
	_cm setPos _exact_pos;
	_cm spawn {sleep 10; _this allowDamage true};
	{_cm removeMagazineGlobal _x} forEach (magazines _cm);
    _cm call FUNC(clearcargo);
	_cm lock true;
	_cm setVectorup [0,0,-1];
	_cm setDamage 0;
#ifdef __DEBUG__
    [format["uav_%1",_cm], _cm,"ICON","ColorBlack",[0.5,0.5],"uav",0,"mil_dot"] call FUNC(CreateMarkerLocal);
#endif	
	__AddToExtraVec(_cm)
	_cm addEventHandler ["killed", {_this call FUNC(KilledSMTargetNormal);(param [0]) spawn {sleep 2;deleteVehicle _this}}];
	_cm addMPEventHandler ["MPKilled", {
		if (isServer) then {
			if (isPlayer (param [1])) then {(param [1]) addScore 5};
		};
	}];
	sleep 20;
	_time_over = 3;
	_enemy_created = false;
	GVAR(cruise_m_enemy) = false;
	_endtime = time + 1200;
	while {true} do {
		if (isNull _cm || {!alive _cm} || {GVAR(cruise_m_enemy)}) exitWith {};
		if (_time_over > 0) then {
			if (_time_over == 3) then {
				if (_endtime - time <= 600) then {
					_time_over = 2;
					[29] remoteExecCall ["d_fnc_DoKBMsg", 2];
				};
			} else {
				if (_time_over == 2) then {
					if (_endtime - time <= 300) then {
						_time_over = 1;
						[31] remoteExecCall ["d_fnc_DoKBMsg", 2];
					};
				} else {
					if (_time_over == 1) then {
						if (_endtime - time <= 120) then {
							_time_over = 0;
							[33] remoteExecCall ["d_fnc_DoKBMsg", 2];
						};
					};
				};
			};
		} else {
			if (!_enemy_created) then {
				_trigger = [_exact_pos, [20,20,0,false], [GVAR(enemy_side),"PRESENT",false], ["this","d_cruise_m_enemy = true",""]] call FUNC(CreateTrigger);
				_enemy_created = true;
				_estart_pos = [_exact_pos,300] call FUNC(GetRanPointCircleOuter);
				_unit_array = ["basic", GVAR(enemy_side)] call FUNC(getunitlistm);
				_ran = [2,4] call FUNC(GetRandomRangeInt);
				for "_i" from 1 to _ran do {
					_newgroup = [GVAR(enemy_side)] call FUNC(creategroup);
					_units = [_estart_pos, _unit_array, _newgroup] call FUNC(makemgroup);
					sleep 1.045;
					_leader = leader _newgroup;
					_leader setRank "LIEUTENANT";
					_newgroup allowFleeing 0;
					_newgroup deleteGroupWhenEmpty true;
					[_newgroup, _exact_pos] call FUNC(AttackWP);
					GVAR(x_sm_rem_ar) append _units;
					{_x triggerDynamicSimulation true; false} count _units;
					sleep 1.012;
				};				
				_unit_array = nil;
			};
		};
		sleep 5.223;
		if (GVAR(sm_resolved)) exitWith {};
	};

	if (!isNull _trigger) then {deleteVehicle _trigger};

	if (GVAR(cruise_m_enemy) && {!isNull _cm}) then {
		_cm removeAllEventHandlers "killed";
		GVAR(sm_winner) = -878;
	};
	
	GVAR(cruise_m_enemy) = nil;
	
	if (!GVAR(sm_resolved)) then {
	   GVAR(sm_resolved) = true;
	};
};
