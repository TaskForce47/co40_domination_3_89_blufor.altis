/**
 *  @author Willard
 *  @description
 *  Deletes a team
 *  @params none
 *  @return nothing
 */
// determine team to delte
_curSel = lbCurSel 1801;

if(_curSel < 0) exitWith {};
_savedTeams = missionNamespace getVariable ["tf47_modules_umenu_savedTeam", []];

// Delete and redraw all markers
for "_i" from 0 to (count _savedTeams) - 1 do {
    _markerName = format["tf47_modules_umenu_ft_marker_%1", _i];
    deleteMarker _markerName;
};

_savedTeams deleteAt _curSel;
_baseMarkerpos = getMarkerPos "tf47_modules_umenu_ft_marker_start";

{
    _yOffset = _forEachIndex * 200;

    _markerName = format["tf47_modules_umenu_ft_marker_%1", _forEachIndex];
    _marker = createMarker [_markerName, [_baseMarkerpos select 0,
        ((_baseMarkerpos select 1) - _yOffset)]];

    _marker setMarkerShape "ICON";
    _marker setMarkerType (_x select 1);
    _marker setMarkerColor (_x select 4);

    _leaderName = _x select 2;
    _freq = _x select 3;
    if(_freq == "") then {
        _marker setMarkerText format["%1 | %2", _x select 0, _x select 2];
    } else {
        _marker setMarkerText format["%1 | %2 | Channel: %3", _x select 0,
            _x select 2, _x select 3];
    };
} forEach _savedTeams;

missionNamespace setVariable ["tf47_modules_umenu_savedTeam", _savedTeams, true];

// delete team from the listbox
lbDelete [1801, _curSel];