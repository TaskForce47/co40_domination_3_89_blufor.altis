/**
 *  @author Willard
 *  @description
 *  Updates the current viewdistane
 *  @params none
 *  @return nothing
 */
switch (true) do {
    case ((vehicle player) isKindOf "Man"): {
        setViewDistance tf47_modules_umenu_vd_vdfoot;
    };
    case ((vehicle player) isKindOf "LandVehicle" ||
        (vehicle player) isKindOf "Ship"): {
        setViewDistance tf47_modules_umenu_vd_vdcar;
    };
    case ((vehicle player) isKindOf "Air"): {
        setObjectViewDistance tf47_modules_umenu_vd_vdair;
    };
};

setObjectViewDistance tf47_modules_umenu_vd_vdobject;

// terrain (grass)
setTerrainGrid tf47_modules_umenu_vd_vdterrain;