/**
 *  @author Willard
 *  @description
 *  Inits the umenu/viewdistance on the player
 *  @params none
 *  @return nothing
 */
// Add the key event handler
waitUntil { !isNull (findDisplay 46) };
(findDisplay 46) displayAddEventHandler 
    ["KeyDown", "if((_this select 3) && (_this select 1) == 22 && 
        !dialog) then { createDialog 'tf47_modules_umenu_main_dialog';
    };"]; 

// get saved vd values
tf47_modules_umenu_vd_vdfoot = profileNamespace getVariable
    ["tf47_modules_umenu_vd_savedFoot", viewDistance];
tf47_modules_umenu_vd_vdcar = profileNamespace getVariable
    ["tf47_modules_umenu_vd_savedCar", viewDistance];
tf47_modules_umenu_vd_vdair = profileNamespace getVariable
    ["tf47_modules_umenu_vd_savedAir", viewDistance];
tf47_modules_umenu_vd_vdobject = profileNamespace getVariable
    ["tf47_modules_umenu_vd_savedObject", getObjectViewDistance select 0];
tf47_modules_umenu_vd_vdterrain = profileNamespace getVariable
    ["tf47_modules_umenu_vd_savedTerrain", 12.5];

// track vehicle change
player addEventHandler ["GetInMan", {
    if((_this select 2) isKindOf "LandVehicle" || 
        (_this select 2) isKindOf "Ship") then {
        setViewDistance tf47_modules_umenu_vd_vdcar;
    } else {
        setViewDistance tf47_modules_umenu_vd_vdair;
    };
}];

player addEventHandler ["GetOutMan", {
    setViewDistance tf47_modules_umenu_vd_vdfoot;
}];

// update the vd
[] call tf47_modules_umenu_fnc_updateViewDistance;
