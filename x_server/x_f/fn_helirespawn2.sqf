// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_helirespawn2.sqf"
#include "..\..\x_setup.sqf"

__TRACE("Start")

sleep (20 + random 10);

while {true} do {
	{
		__TRACE_1("","_x")
		private _vec_a = _x;
		private _vec = _vec_a select 0;
		private _ifdamage = _vec_a select 2;
		
		private _empty = {alive _x} count (crew _vec) == 0;
		
		private _disabled = false;
		if (!_ifdamage) then {
			if (_empty) then {
				private _empty_respawn = _vec_a select 3;
				if (_empty_respawn == -1) then {
					if (_vec distance2D (_vec_a select 4) > 10) then {
						_vec_a set [3, time + (_vec_a select 7)];
					};
				} else {
					if (time > _empty_respawn) then {
						private _runits = ((allPlayers - entities "HeadlessClient_F") select {!isNil "_x" && {!isNull _x}});
						sleep 0.1;
						if (!(_runits isEqualTo []) && {{_x distance2D _vec < 100} count _runits == 0}) then {
							_disabled = true;
						};
					};
				};
			} else {
				if (alive _vec) then {_vec_a set [3, -1]};
			};
		};
			
		if (!_disabled && {damage _vec >= 0.9}) then {_disabled = true};
		
		if (_empty && {!_disabled && {alive _vec && {_vec call d_fnc_OutOfBounds}}}) then {
			private _outb = _vec getVariable "d_OUT_OF_SPACE";
			if (_outb != -1) then {
				if (time > _outb) then {_disabled = true};
			} else {
				_vec setVariable ["d_OUT_OF_SPACE", time + 600];
			};
		} else {
			_vec setVariable ["d_OUT_OF_SPACE", -1];
		};
		
		sleep 0.01;
		
		if (_empty && {_disabled || {!alive _vec}}) then {
			private _fuelleft = _vec getVariable ["d_fuel", 1];
			if (_vec getVariable ["d_ammobox", false]) then {
				d_num_ammo_boxes = d_num_ammo_boxes - 1; publicVariable "d_num_ammo_boxes";
			};
			private _isitlocked = _vec getVariable "d_vec_islocked" || {_vec call d_fnc_isVecLocked};
			private _ropes = _vec getVariable "d_ropes";
			if (!isNil "_ropes") then {
				{ropeDestroy _x;false} count (_ropes select {!isNull _x});
			};
			private _attached = _vec getVariable "d_attachedto_v";
			if (!isNil "_attached") then {
				detach _attached;
				_vec setVariable ["d_attachedto_v", nil, true];
			};
			sleep 0.1;
			deleteVehicle _vec;
			if (!_ifdamage) then {_vec_a set [3,-1]};
			sleep 0.5;
			_vec = createVehicle [_vec_a select 6, _vec_a select 4, [], 0, "NONE"]; //"NONE"
			_vec setDir (_vec_a select 5);
			_vec setPos (_vec_a select 4);
#ifdef __CARRIER__
			private _cposc = _vec_a select 4;
			__TRACE_2("","_vec","_cposc")
			if (surfaceIsWater _cposc) then {
				_cposc set [2, d_carrier_height];
				[_vec, _cposc] spawn {
					params ["_vec", "_cposc"];
					sleep 1;
					_vec setPosASL _cposc;
					_vec setDamage 0;
				};
			};
#endif
			_vec setVariable ["d_vec_islocked", _isitlocked];
			if (_isitlocked) then {_vec lock true};
			
			_vec setFuel _fuelleft;
			_vec setDamage 0;
			
			_vec addEventhandler ["local", {_this call d_fnc_heli_local_check}];
			
			_vec_a set [0, _vec];
			d_helirespawn2_ar set [_forEachIndex, _vec_a];
			_vec setVariable ["d_OUT_OF_SPACE", -1];
			_vec setVariable ["d_vec", _vec_a select 1, true];
#ifdef __TT__
			if (_vec_a select 1 < 4000) then {
				_vec addMPEventhandler ["MPKilled", {if (isServer) then {_this call d_fnc_checkveckillblufor}}];
			} else {
				_vec addMPEventhandler ["MPKilled", {if (isServer) then {_this call d_fnc_checkveckillopfor}}];
			};
#endif
			_vec addMPEventhandler ["MPKilled", {if (isServer) then {_this call d_fnc_chopperkilled}}];
			_vec remoteExecCall ["d_fnc_initvec", [0, -2] select isDedicated];
		};
		sleep (20 + random 10);
	} forEach d_helirespawn2_ar;
	sleep (20 + random 10);
};
