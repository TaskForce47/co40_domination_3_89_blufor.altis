/**
 *  @author Willard
 *  @description
 *  Update the loadout content lixtbox
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
_data = call compile _data;

// clear the listbox
lbClear 1501;

// determine module
if(_data select 1) then {
    ctrlSetText [1003, "Nein"];
} else {
    ctrlSetText [1003, "Ja"];
};

// determine the loadout type (ace/vanilla)
// then add the content to the listbox
if(ctrlEnabled 1605) then {
    for "_i" from 2 to ((count _data) - 1) do {
        lbAdd [1501, format["%1 x %2", (_data select _i) select 1, getText
            (configFile >> (_data select _i) select 2 >> (_data select _i) select 0
            >> "displayName")]
        ];
    };
} else {
    for "_i" from 2 to ((count _data) - 1) do {
        lbAdd [1501, format["%1 x %2", (_data select _i) select 1, getText
            (configFile >> "CfgVehicles" >> (_data select _i) select 0
            >> "displayName")]
        ];
    };
};
