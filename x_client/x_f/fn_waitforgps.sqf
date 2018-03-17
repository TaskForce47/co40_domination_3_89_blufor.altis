// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_waitforgps.sqf"
#include "..\..\x_setup.sqf"

disableSerialization;
sleep 10;
__TRACE_1("","uiNamespace getVariable 'IGUI_displays'")
waitUntil {visibleGPS};
__TRACE("starting")
__TRACE_1("","(uiNamespace getVariable 'RscCustomInfoMiniMap')")
((uiNamespace getVariable "RscCustomInfoMiniMap") displayCtrl 101) ctrlAddEventHandler ["Draw", {[[(uiNamespace getVariable "RscCustomInfoMiniMap") displayCtrl 101, 0], 0] call d_fnc_mapondraw}];
/*
private _gps = controlNull;
__TRACE_1("","uiNamespace getVariable 'IGUI_displays'")
{
	if (!isNil "_x" && {!isNull _x && {!isNil {_x displayctrl 101}}}) then {
		_gps = _x displayctrl 101;
	};
	false
} count (uiNamespace getVariable "IGUI_displays");
__TRACE_1("","_gps")
if (!isNull _gps) then {
	_gps ctrlAddEventHandler ["Draw", {[_this, 1] call d_fnc_mapondraw}];
};
*/