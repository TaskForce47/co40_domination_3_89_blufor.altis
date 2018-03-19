/**
 *  @author Willard
 *  @description
 *  Update the pylon content lixtbox
 *  @params 
 *      param 0: The listbox index <NUMBER> (required)
 *  @return nothing
 */
_result = _this params [
    ["_index", -1, [-1]]
];
// Check for valid index
if(_index <= -1) exitWith {};

// get the loadout details
_data = lbData [1500, _index];
if(_data == "") exitWith {};
_data = call compile _data;

// clear the listbox
lbClear 1501;
lbSetCurSel [1501, -1];
{
	_index = lbAdd [1501, getText 
		(configFile >> "CfgMagazines" >> _x >> "displayName")];
	lbSetData [1501, _index, str [_x, ""]];
} forEach (_data select 0);

_vehicle = (player getVariable['tf47_modules_sp_vehicle', player]);

_turrets = ("true" configClasses 
    (configfile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets"));

if((count _turrets) >= 1) then {
	{
		_index = lbAdd [1501, format["%1%2", getText 
			(configFile >> "CfgMagazines" >> _x >> "displayName"), " (Gunner)"]];
		lbSetData [1501, _index, str [_x, configName (_turrets select 0)]];
	} forEach (_data select 0);
};

lbSetCurSel [1501, _data select 1];