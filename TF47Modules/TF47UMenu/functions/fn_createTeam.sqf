/**
 *  @author Willard
 *  @description
 *  Creates a new team
 *  @params none
 *  @return nothing
 */
 // determine c/s, leader, marker, freq
_callsign = "";
if(ctrlVisible 1400) then {
    _callsign = ctrlText 1400;
} else {
    _callsign = lbText [2101, lbCurSel 2101];
};
_leaderName = ctrlText 1401;

_data = lbData [2100, lbCurSel 2100] splitString "#";
_markerType = _data select 0;
_markerColor = _data select 1;

if(_callsign == "" || _leaderName == "" || _markerType == "") exitWith {};

if(_markerColor == "") then {
    _markerColor = "ColorBLUFOR";
};

_freq = ctrlText 1402;

// retrieve existing teams and add the new team
_savedTeams = missionNamespace getVariable ["tf47_modules_umenu_savedTeam", []];
_savedTeams pushBack [_callsign, _markerType, _leaderName, _freq, _markerColor];
missionNamespace setVariable ["tf47_modules_umenu_savedTeam", _savedTeams, true];

// add it to the listbox
_index = lbAdd [1801, _callsign];
lbSetPicture [1801, _index, format["\a3\ui_f\data\map\Markers\NATO\%1.paa",
    _markerType]];
lbSetPictureColor [1801, _index, [1,1,1,1]];
_tooltip = "";
if(_freq == "") then {
    _tooltip = format["Leader: %1", _leaderName];
} else {
    _tooltip = format["Leader: %1 | Channel: %2", _leaderName, _freq];
};
lbSetTooltip [1801, _index, _tooltip];

// add the marker
_markerName = format["tf47_modules_umenu_ft_marker_%1", (count _savedTeams) - 1];
_yOffset = ((count _savedTeams) - 1) * 200;
_baseMarkerpos = getMarkerPos "tf47_modules_umenu_ft_marker_start";

_marker = createMarker [_markerName, [_baseMarkerpos select 0,
    (_baseMarkerpos select 1) - _yOffset]];
_marker setMarkerShape "ICON";
_marker setMarkerType _markerType;
_marker setMarkerColor _markerColor;

if(_freq == "") then {
    _marker setMarkerText format["%1 | %2", _callsign, _leaderName];
} else {
    _marker setMarkerText format["%1 | %2 | Channel: %3", _callsign,
        _leaderName, _freq];
};