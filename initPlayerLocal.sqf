// by Xeno
//#define __DEBUG__
#define THIS_FILE "initPlayerLocal.sqf"
#include "x_setup.sqf"
diag_log [diag_frameno, diag_ticktime, time, "Executing MPF initPlayerLocal.sqf"];
__TRACE_1("","_this")
if (hasInterface && {d_with_bis_dynamicgroups == 0}) then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};
player enableAttack false;

if (hasInterface) then {
	private _np = profileName splitString """'" joinString "";
	//  && {!(_np isEqualTo "Error: No unit")})
	if !(_np isEqualTo (player getVariable ["d_plname", ""])) then {
		player setVariable ["d_plname", _np, true];
	};
	d_name_pl = _np;
};

execVM "tasks.sqf";
diag_log [diag_frameno, diag_ticktime, time, "MPF initPlayerLocal.sqf processed"];

_null = [] execVM "VA.sqf";
/* TF47CoreScripts - Start */
waitUntil {
	if(!(isNil "tf47_core_server_init")) then {
		tf47_core_server_init
	} else {
		false
	}
};
[player] remoteExec ["tf47_core_whitelist_fnc_checkSlotWhitelist", 2];
[player] remoteExec ["tf47_core_fnc_initPlayer", 2];
/* TF47CoreScripts - End */

/* TF47Modules */
waitUntil{ if(!isNil "tf47_modules_init_complete") then {
		tf47_modules_init_complete
	} else {
		false
	};};
waitUntil { !isNull (findDisplay 46) };
[] call tf47_modules_umenu_fnc_initPlayer;

(findDisplay 46) displayAddEventHandler
    ["KeyDown", "if((_this select 4) && (_this select 1) == 22 &&
        !dialog) then { _nul = [] spawn tf47_modules_core_fnc_initMenu;
    };"];
