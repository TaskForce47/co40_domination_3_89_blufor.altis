/**
 *  @author Willard
 *  @description
 *  Gets the configType of a item
 *  @params 
 *      param 0: The item classname <STRING> (required)
 *  @return The configType of the item
 */
_result = _this params [
    ["_item", "", [""]]
];

// check for empty classname
if(_item == "") exitWith {
    ["getConfigType called with empty string", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// determine the config type
_configType = "";
switch (true) do {
    case (isClass (configFile >> "CfgMagazines" >> _item)) : {
        _configType = "CfgMagazines";
    };
    case (isClass (configFile >> "CfgWeapons" >> _item)): {
        _configType = "CfgWeapons";
    };
    case (isClass (configFile >> "CfgVehicles" >> _item)): {
        _configType = "CfgVehicles";
    };
    case (isClass (configFile >> "CfgGlasses" >> _item)): {
        _configType = "CfgGlasses";
    };
};

_configType
