/**
 *  @author Willard
 *  @description
 *  Inits the vd dialog
 *  @params none
 *  @return nothing
 */
waitUntil {(ctrlText 1001) != ""};

// set the vd values
{
    ctrlSetText [_x select 0, str (_x select 1)];
} forEach [[1400, tf47_modules_umenu_vd_vdfoot],
    [1401, tf47_modules_umenu_vd_vdcar],
    [1402, tf47_modules_umenu_vd_vdair],
    [1403, tf47_modules_umenu_vd_vdobject]];

// set the slider values
{
    sliderSetRange [_x select 0, 0, 15000];
    sliderSetSpeed [_x select 0, 100, 100];
    sliderSetPosition [_x select 0, _x select 1];
} forEach [[1900, tf47_modules_umenu_vd_vdfoot],
    [1901, tf47_modules_umenu_vd_vdcar],
    [1902, tf47_modules_umenu_vd_vdair],
    [1903, tf47_modules_umenu_vd_vdobject]];

// set the grass detail
_index = -1;
{
    _index = lbAdd [1904, _x select 0];
    lbSetData [1904, _index, _x select 1]
} forEach [["None", "50"], ["Low", "25"], ["Normal", "12.5"], ["High", "6.25"],
    ["Very High", "3.125"]];

lbSetCurSel [1904, [50, 25, 12.5, 6.25, 3.125] find
    tf47_modules_umenu_vd_vdterrain];
