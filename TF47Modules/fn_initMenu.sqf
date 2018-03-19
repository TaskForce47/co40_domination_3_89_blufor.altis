/**
 *  @author Willard
 *  @description
 *  Shows the sp/vs
 *  @params none
 *  @return nothing
 */
// wait for the config

waitUntil{ !isNil "tf47_modules_sp_markers"; };
waitUntil{ !isNil "tf47_modules_vs_config_allMarkers"; };

// get the nearest markers
_nearestVehicleSpawner = [tf47_modules_vs_config_allMarkers, player] call 
	BIS_fnc_nearestPosition;

_nearestServicePoint = [tf47_modules_sp_markers, player] call 
	BIS_fnc_nearestPosition;

// show the dialog dependeing on the player pos
_distanceVs = (getMarkerPos  _nearestVehicleSpawner) distance (getpos player);
_distanceSp = (getMarkerPos  _nearestServicePoint) distance (getpos player);
if(_distanceVs < 10 && _distanceVs < _distanceSp) then {
	createDialog "tf47_modules_vs_main_dialog";
} else {
	if(_distanceSp < 10 && ((vehicle player) != player)) then {
		player setVariable["tf47_modules_sp_vehicle", vehicle player]; 
		createDialog "tf47_modules_sp_main_dialog";
	};
};
_nearestServicePoint = [tf47_modules_sp_markers, getConnectedUAV player] call 
	BIS_fnc_nearestPosition;
_distanceDroneSp = (getMarkerPos  _nearestServicePoint) distance (getConnectedUAV player);
if(_distanceDroneSp < 15) then {
	player setVariable["tf47_modules_sp_vehicle", getConnectedUAV player]; 
	createDialog "tf47_modules_sp_main_dialog";
};