/**
 *  @author Willard
 *  @description
 *  Gets the free inventory space
 *  @params 
 *      param 0: The vehicle <object> (required)
 *  @return Free inventory space
 */

private["_result", "_vehicle", "_weaponItemsCargo", "_magazineCargo",
    "_itemCargo", "_backpackCargo", "_weaponMass", "_magazineMass",
    "_itemMass", "_backpackContentMass", "_totalMass"];

_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["getFreeVanillaInventory called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_hasInventory = (getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> 
    "transportmaxbackpacks")) + 
    (getNumber (configFile >> "CfgVehicles" >> 
    (typeOf _vehicle) >> "transportmaxmagazines")) +
    (getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> 
    "transportmaxweapons"));

if(_hasInventory == 0) exitWith { 0 };

// get the cargo
_weaponItemsCargo = weaponsItemsCargo _vehicle;
_magazineCargo = magazineCargo _vehicle;
_itemCargo = itemCargo _vehicle;
_backpackCargo = backpackCargo _vehicle;

// sum weapons
_weaponMass = 0;
{
    _weaponMass = _weaponMass +
        getNumber (configFile >>
            "CfgWeapons" >> _x select 0 >> "WeaponSlotsInfo" >> "mass");
    if((_x select 1) != "") then {_itemCargo pushBack (_x select 1); };
    if((_x select 2) != "") then {_itemCargo pushBack (_x select 2); };
    if((_x select 3) != "") then {_itemCargo pushBack (_x select 3); };
    if(count (_x select 4) != 0) then {_magazineCargo pushBack
        ((_x select 4) select 0); };
    if(count (_x select 5) != 0) then {_magazineCargo pushBack
        ((_x select 5) select 0); };
    if((_x select 6) != "") then {_magazineCargo pushBack (_x select 6); };
} forEach _weaponItemsCargo;

// sum magazines
_magazineMass = 0;
{
    _magazineMass = _magazineMass +
        getNumber (configFile >> "CfgMagazines" >> _x >> "mass");
} forEach _magazineCargo;

// sum items
_itemMass = 0;
{
    _itemMass = _itemMass +
        getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
    _itemMass = _itemMass +
        getNumber (configFile >> "CfgGlasses" >> _x >> "mass");
} forEach _itemCargo;

// sum backpacks recursive
_backpackContentMass = 0;
{
    _backpackContentMass = _backpackContentMass +
        getNumber (configFile >> "CfgVehicles" >> (_x select 0) >> "mass");
    _backpackContentMass =_backpackContentMass +
        ((_x select 1) call tf47_modules_servicepoint_fnc_getFreeVanillaInventory);

} forEach (everyContainer _vehicle);

// sum everything
_totalMass = _weaponMass + _magazineMass + _itemMass +
    _backpackContentMass;

_totalMass