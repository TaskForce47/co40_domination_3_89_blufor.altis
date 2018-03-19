/**
 *  @author Willard
 *  @description
 *  Inits the FT dialog
 *  @params none
 *  @return nothing
 */
waitUntil {(ctrlText 1001) != ""};

// populate the listbox with the teams
_savedTeams = missionNamespace getVariable ["tf47_modules_umenu_savedTeam", []];
{
    _index = lbAdd [1801, _x select 0];
    lbSetPicture [1801, _index, format["\a3\ui_f\data\map\Markers\NATO\%1.paa",
        _x select 1]];
    lbSetPictureColor [1801, _index, [1,1,1,1]];

    _leaderName = _x select 2;
    _freq = _x select 3;
    _tooltip = "";
    if(_freq == "") then {
        _tooltip = format["Leader: %1", _leaderName];
    } else {
        _tooltip = format["Leader: %1 | Channel: %2", _leaderName, _freq];
    };
    lbSetTooltip [1801, _index, _tooltip];

} forEach _savedTeams;

// populate the listboxes with available markers and c/s
_slotName = format ["%1", player];
_callsigns = [];
{
    if ([_x select 0, _slotName] call tf47_modules_umenu_fnc_endsWith) then {
        _index = lbAdd [2100, _x select 3];
        lbSetData [2100, _index, format["%1#%2", _x select 1, _x select 2]];
        lbSetPicture [2100, _index,
            format ["\a3\ui_f\data\map\Markers\NATO\%1.paa", _x select 1]];
        lbSetPictureColor [2100, _index, [1,1,1,1]];
        lbSetPictureColorSelected [2100, _index, [1,1,1,1]];

        {
            _callsigns pushBackUnique _x;
        } forEach (_x select 4);
    };
} forEach tf47_modules_umenu_config;

// chow custom or predefined c/s
lbSetCurSel [2100, 0];
if (count _callsigns == 0) then {
    ctrlShow [1400, true];
    ctrlShow [2101, false];
} else {
    ctrlShow [1400, false];
    ctrlShow [2101, true];
    {
        lbAdd [2101, _x];
    } forEach _callsigns;
};

ctrlSetText [1401, name player];
