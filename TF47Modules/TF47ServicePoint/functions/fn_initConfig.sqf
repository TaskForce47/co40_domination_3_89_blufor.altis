/**
 *  @author Willard
 *  @description
 *  Compiles and executes the config and cleans it up
 *  @params none
 *  @return nothing
 */
// call and execute config
call compileFinal preprocessFileLineNumbers "TF47ServicePointConfig.sqf";

// clean up of the loadout config
// O(n^2) ist bad but thats why we do it only at the start
{
    // first and second is name and module, last is dummy array
    // (which gets removed)
    for "_i" from 2 to (count _x - 2) do {
        _className = (_x select _i) select 0;
        (_x select _i) pushBack ([_className] call
            tf47_modules_servicepoint_fnc_getConfigType);
    };
    _x deleteAt (count _x - 1);
} forEach tf47_modules_sp_loadouts_config;

tf47_modules_sp_loadouts_config deleteAt (count tf47_modules_sp_loadouts_config
    - 1);

publicVariable "tf47_modules_sp_loadouts_config";

// clean up of the ace loadout config
{
    _x deleteAt (count _x - 1);
} forEach tf47_modules_sp_loadouts_aceConfig;

tf47_modules_sp_loadouts_aceConfig deleteAT (count
    tf47_modules_sp_loadouts_aceConfig - 1);

publicVariable "tf47_modules_sp_loadouts_aceConfig";

tf47_modules_sp_ammo_tankAmmo = [
    [
        "BWA3_Leopard_base",
        "rhsusf_m1a1tank_base",
        "rhsusf_m109tank_base",
        "RHS_M119_base"
    ],
    [
        [   
            "BWA3_1Rnd_KE_shells", "BWA3_1Rnd_HE_shells", "BWA3_1Rnd_MZ_shells",
            "BWA3_1Rnd_Canister_shells", "BWA3_1Rnd_LAHAT"
        ],
        [
            "rhs_mag_M1069", "rhs_mag_M829A3", "rhs_mag_M829A2", 
            "rhs_mag_M829A1", "rhs_mag_M829", "rhs_mag_M830", "rhs_mag_M830A1",
		    "rhs_mag_M1028"
        ],
        [
            "32Rnd_155mm_Mo_shells", "6Rnd_155mm_Mo_smoke", 
            "2Rnd_155mm_Mo_guided", "2Rnd_155mm_Mo_LG", "2Rnd_155mm_Mo_Cluster",
            "6Rnd_155mm_Mo_AT_mine", "6Rnd_155mm_Mo_mine"
        ],
        [
            "RHS_mag_m1_he_12", "rhs_mag_m60a2_smoke_4", "rhs_mag_m314_ilum_4"
        ]
    ],
    [
        37,
        32,
        39,
        20
    ],
    [
        "30Rnd_120mm_HE_shells",
        "rhs_mag_M1069",
        "32Rnd_155mm_Mo_shells",
        "32Rnd_155mm_Mo_shells"
    ]
];
publicVariable "tf47_modules_sp_ammo_tankAmmo";