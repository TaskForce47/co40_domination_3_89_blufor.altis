/**
 *  @author Willard
 *  @description
 *  Handles the slider/value change
 *  @params
 *      param 0: The mode (car, air, etc.) <NUMBER> (required)
 *      param 1: The idc of the slider <NUMBER> (required)
 *      parma 2: The new value <NUMBER> (required)
 *  @return nothing
 */
_result = _this params [
    ["_mode", 0, [0]],
    ["_idc", 0, [0]],
    ["_newValue", 0, [0]]
];

// check for invalid idc
if(_idc < 0) exitWith {
    ["onSliderChange called without a valid idc!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// check for invalid mode
if(_mode < 0 || _mode > 3) exitWith {
    ["onSliderChange called without a valid mode!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// if the new value is -1 the text value was changed
// otherwise the slide was changed
if(_newValue == -1) then {
    _newValue = parseNumber (ctrlText _idc);
    ctrlSetText [_idc, str _newValue];
    sliderSetPosition [_idc + 500, _newValue];
} else {
    _newValue = round _newValue;
    sliderSetPosition [_idc, _newValue];
    ctrlSetText [_idc - 500, str _newValue];
};

// change the corresponding value
switch (_mode) do {
    case (0): {
        tf47_modules_umenu_vd_vdfoot = _newValue;
    };
    case (1): {
        tf47_modules_umenu_vd_vdcar = _newValue;
    };
    case (2): {
        tf47_modules_umenu_vd_vdair = _newValue;
    };
    case (3): {
        tf47_modules_umenu_vd_vdobject = _newValue;
    };
};

// update the vd
[] call tf47_modules_umenu_fnc_updateViewDistance;