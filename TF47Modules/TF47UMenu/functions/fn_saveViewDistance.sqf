/**
 *  @author Willard
 *  @description
 *  Saves the current view distance setting
 *  @params none
 *  @return nothing
 */
profileNamespace setVariable ["tf47_modules_umenu_vd_savedFoot",
    tf47_modules_umenu_vd_vdfoot];
profileNamespace setVariable ["tf47_modules_umenu_vd_savedCar",
    tf47_modules_umenu_vd_vdcar];
profileNamespace setVariable ["tf47_modules_umenu_vd_savedAir",
    tf47_modules_umenu_vd_vdair];
profileNamespace setVariable ["tf47_modules_umenu_vd_savedObject",
    tf47_modules_umenu_vd_vdobject];
profileNamespace setVariable ["tf47_modules_umenu_vd_savedTerrain",
    tf47_modules_umenu_vd_vdterrain];
saveProfileNamespace;
