/**
 *  @author Willard
 *  @description
 *  Inits the vanilla loudout dialog
 *  @params none
 *  @return nothing
 */
// Clear the listboxes
lbClear 1500;
lbClear 1501;

// reset the current selection index
lbSetCurSel [1500, -1];
lbSetCurSel [1501, -1];

// Add the loadouts
{
    _index = lbAdd [1500, _x select 0];
    lbSetData [1500, _index, str _x];
} forEach tf47_modules_sp_loadouts_config;
