/**
 *  @author Willard
 *  @description
 *  Inits the main dialog
 *  @params none
 *  @return nothing
 */
waitUntil {(ctrlText 1001) != ""};

disableSerialization;

// disable gnc button, if the player is not the leader
if (leader (group player) != player) then {
    ctrlEnable [1602, false];
	((uiNamespace getVariable ['tf47_modules_umenu_main_dialog_var',nil])
        displayCtrl 1602) ctrlSetTooltip
        "Only the group leader can change the group name!";
};

// show tickets
if(!isNil "tf47_core_ticketsystem_tickets") then {
    ctrlSetText [1003, format["  %1", tf47_core_ticketsystem_tickets]];
} else {
    ctrlShow [1001, false];
    ctrlShow [1003, false];
};

// show slot cost
_ticketCost = missionNamespace getVariable 
                [format ["tf47_core_ticketsystem_cost_%1", 
                (player call BIS_fnc_netId)],-1];
//_ticketCost = player getVariable ["tf47_core_ticketsystem_cost", -1];
if(_ticketCost != -1) then {
    ctrlSetText [1005, format["  %1", _ticketCost]];
} else {
    ctrlShow [1004, false];
    ctrlShow [1005, false];
};