/**
 *  @author Willard
 *  @description
 *  Inits the pylon dialog
 *  @params none
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];
if(_vehicle == player || isNull _vehicle) exitWith {
    ["You are not in a valid vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};


// Clear the listboxes
lbClear 1500;
lbClear 1501;

// reset the current selection index
lbSetCurSel [1500, -1];
lbSetCurSel [1501, -1];


_pylons = configProperties [configfile >> "CfgVehicles" >> typeOf _vehicle >> 
	"Components" >> "TransportPylonsComponent" >> "Pylons" , "true", true];

{
    _index = lbAdd [1500, configName (_pylons select _forEachIndex)];
    if((count _x) > 0) then {
        lbSetData [1500, _index, str [_x, -1, _x select 0]];
    } else {
        lbSetData [1500, _index, ""];
    };
} forEach (_vehicle getCompatiblePylonMagazines 0);