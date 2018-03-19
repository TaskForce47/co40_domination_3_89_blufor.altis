/**
 *  @author Willard
 *  @description
 *  Inits the main dialog
 *  @params none
 *  @return nothing
 */
waitUntil {(ctrlText 1001) != ""};

// clear listbox
lnbClear 1500;

// get the nearest marker and determine the index
_nearestMarker = [tf47_modules_vs_config_allMarkers, player] call 
    BIS_fnc_nearestPosition;

_index = -1;
{
    if((_x select 0) == _nearestMarker) then {
        _index = _forEachIndex;
    };
} forEach tf47_modules_vs_config;

// populate the listbox
_curConfig = tf47_modules_vs_config select _index;

for "_i" from 1 to ((count _curConfig) - 1) do {
    _config = _curConfig select _i;

    _whitelistId = _config select 1;
    _ticketCost = _config select 2;
    _slots = _config select 3;

    {
        _configPath = (configFile >> "CfgVehicles" >> _x);
        _row = lnbAddRow [1500, [getText (_configPath >> "displayName"), 
            str _ticketCost, str _whitelistId]];
        _picture =  getText (_configPath >> "picture");
        if(_picture == "pictureThing") then {
            _picture = "\a3\ui_f\data\map\VehicleIcons\iconvehicle_ca.paa";
        };
        lnbSetPicture [1500, [_row, 0], _picture];
        lnbSetPictureColor [1500,[_row,0],[1,1,1,1]];
        lnbSetData [1500, [_row, 0], str [(_curConfig select 0), _x, _whitelistId, _ticketCost, _slots]];
    } forEach (_config select 0);
};
lnbSetCurSelRow [1500, 0];