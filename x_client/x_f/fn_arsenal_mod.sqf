// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_arsenal_mod.sqf"
#include "..\..\x_setup.sqf"

private _mods = _this apply {toLower _x};
__TRACE_1("","_mods")

#define __usenot ["firstaidkit", "medikit", "itemmap", "itemradio", "itemcompass", "itemwatch"]

private _findmodfnc = {
	params ["_csal"];
	private _res = -1;
	{
		if ((toLower (_csal select 0)) find _x != -1) exitWith {
			_res = 1;
			true
		};
		false
	} count _mods;
	_res
};

{
	private _ar = _x;
	__TRACE_1("","_x")
	{
		if !(toLower _x in __usenot) then {
		//if (_x != "FirstAidKit" && {_x != "Medikit" && {_x != "ItemMap" && {_x != "ItemRadio" && {_x != "ItemCompass" && {_x != "ItemWatch"}}}}}) then {
			private _kind = if (isClass (configFile >> "CfgWeapons" >> _x)) then {
				"CfgWeapons"
			} else {
				if (isClass (configFile >> "CfgMagazines" >> _x)) then {
					"CfgMagazines"
				} else {
					if (isClass (configFile >> "CfgVehicles" >> _x)) then {
						"CfgVehicles"
					} else {
						if (isClass (configFile >> "CfgGlasses" >> _x)) then {
							"CfgGlasses"
						} else {
							""
						};
					};
				};
			};
			__TRACE_1("","_kind")
			if (_kind != "" && {([configSourceAddonList (configFile >> _kind >> _x)] call _findmodfnc) == -1}) then {
				_ar set [_forEachIndex, -1];
			};
		};
	} forEach _ar;
	_ar = _ar - [-1];
	bis_fnc_arsenal_data set [_forEachIndex, _ar];
} forEach bis_fnc_arsenal_data;