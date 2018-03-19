/**
 *  @author Willard
 *  @description
 *  Inits the tank ammo dialog
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
lbClear 2100;
lbClear 2101;
lbClear 2102;

// reset the current selection index
lbSetCurSel [2100, -1];
lbSetCurSel [2101, -1];
lbSetCurSel [2102, -1];


_ammo = (tf47_modules_sp_ammo_tankAmmo select 1) select 
	((tf47_modules_sp_ammo_tankAmmo select 0) 
		find ((tf47_modules_sp_ammo_tankAmmo select 0) 
		select {_vehicle isKindOf _x} select 0));

for "_i" from 0 to 2 do 
{
	_id = 2100 + _i;	
	{
		_rounds = getNumber (configFile >> "CfgMagazines" >> _x >> "count");
		_index = lbAdd [_id, 
			getText(configfile >> "CfgMagazines" >> _x >> "displayName")];
		lbSetData [_id, _index, _x];
	} forEach _ammo;
};