/**
 *  @author Willard
 *  @description
 *  Update the pylon magazine listbox
 *  @params 
 *      param 0: The listbox index <NUMBER> (required)
 *  @return nothing
 */
_result = _this params [
    ["_index", -1, [-1]]
];
// Check for valid index
if(_index <= -1) exitWith {};


_data = lbData [1500, lbCurSel 1500];
_data = call compile _data;
lbSetData [1500, lbCurSel 1500, str [_data select 0, lbCurSel 1501, lbData [1501, _index]]];