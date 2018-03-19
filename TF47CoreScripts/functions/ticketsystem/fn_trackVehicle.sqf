/**
 *  @author Willard
 *  @description
 *  Tracks a vehicle (map marker, desertion)
 *  @params 
 *      param 0: The vehicle <object> (required)
 *      param 1: The vehicles side <side> (required)
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_side", west, [west]]
];

if(isNull _vehicle) exitWith {
     ["trackVehicle called with null vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// determine marker type and create the marker
_markerType = [_vehicle, _side] call tf47_core_util_fnc_getMarkerType;

_vehiclePos = getPos _vehicle;

_marker = createMarker [format["tf47_core_ticketsystem_trackingMarker_%1",
    str _vehicle],[_vehiclePos select 0, _vehiclePos select 1]];
_marker setMarkerShape "ICON";
_marker setMarkerType _markerType;

// tracking loop, keeps tracking until the vehilce is either dead or
// deserted, and deletes the marker after 300s
_trackingHandle = [_vehicle, _marker] spawn {
    _vehicle = _this select 0;
    _marker = _this select 1;
    _keepTracking = true;
    while {_keepTracking} do {
        if(!isNull _vehicle) then {
            sleep 5;
            //sleep tf47_core_ticketsystem_trackingMarkerUpdate;
            _marker setMarkerPos
                [(getPos _vehicle) select 0, (getPos _vehicle) select 1];
            if((damage _vehicle) == 1 || 
                missionNamespace getVariable 
                [format ["tf47_core_ticketsystem_deserted_%1", 
                (_vehicle call BIS_fnc_netId)], false]) then {
            //(_vehicle getVariable
              //      ["tf47_core_ticketsystem_isDeserted", false])) then {
                _marker setMarkerAlpha 0.3;
            };
            _keepTracking = ((damage _vehicle) != 1);
        } else {
            _keepTracking = false;
            _marker setMarkerAlpha 0.3;
        };
    };
    sleep 300;
    deleteMarker _marker;
};
