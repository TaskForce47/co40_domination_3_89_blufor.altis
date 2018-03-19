/**
 *  @author Willard
 *  @description
 *  Handles the value change of the respawn checkbox
 *  @params 
 *      param 0: The state <NUMBER> (required)
 *  @return nothing
 */
_result = _this params [
    ["_state", 0, [0]]
];

// Check for invalid change
if(_state != 0 && _state != 1) exitWith {
    ["onRespawnCheckedChanged callled with invalid number", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// get the control
_control = uiNamespace getVariable ['tf47_modules_sp_main_dialog_var',nil];

// disable everything else otherwise enable it and check if ace cargo is 
// available
if(_state == 1) then {
    ctrlEnable [2800, false];
    ctrlEnable [2801, false];
    ctrlEnable [2802, false];
    ctrlEnable [2803, false];
    ctrlEnable [2804, false];
    (_control displayCtrl 1017) ctrlSetTextColor [0.3,0.3,0.3,1];
    (_control displayCtrl 1018) ctrlSetTextColor [0.3,0.3,0.3,1];
    (_control displayCtrl 1019) ctrlSetTextColor [0.3,0.3,0.3,1];
    (_control displayCtrl 1020) ctrlSetTextColor [0.3,0.3,0.3,1];
    (_control displayCtrl 1021) ctrlSetTextColor [0.3,0.3,0.3,1];

} else {
    ctrlEnable [2800, true];
    ctrlEnable [2801, true];
    ctrlEnable [2802, true];
    ctrlEnable [2803, true];

    (_control displayCtrl 1017) ctrlSetTextColor [1,1,1,1];
    (_control displayCtrl 1018) ctrlSetTextColor [1,1,1,1];
    (_control displayCtrl 1019) ctrlSetTextColor [1,1,1,1];
    (_control displayCtrl 1020) ctrlSetTextColor [1,1,1,1];

    _aceCargo = [vehicle player] call tf47_modules_servicepoint_fnc_getAceCargo;

    if(_aceCargo != -1) then {
        ctrlEnable [2804, true];
        (_control displayCtrl 1021) ctrlSetTextColor [1,1,1,1];
    };
};
