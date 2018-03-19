/**
 *  @author Willard
 *  @description
 *  Determines the current round number
 *  @params none
 *  @return nothing
 */

if(!isServer) exitWith {
    ["initTicketsystem not called on the server!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

 // build the query for the last round number and commit it, default is 1
_lastRoundResult = "extDB3" callExtension format["0:SQL:getLastRound:%1", 
    tf47_core_ticketsystem_missionId];
_result = (call compile _lastRoundResult) select 1;
_lastRound = 0;
if((typeName _result) == "ARRAY") then {
    if((count _result) != 0) then {
        _lastRound = (_result select 0) select 0;
        if(typeName _lastRound == "STRING") then {
            if(_lastRound == "") then {
                _lastRound = 0;
            };
        };
    };
};

// increment the round number and "commit" it
tf47_core_ticketsystem_round = _lastRound + 1;
publicVariable "tf47_core_ticketsystem_round";

tf47_core_ticketsystem_endingScript = scriptNull;
publicVariable "tf47_core_ticketsystem_endingScript";

// show current tickets every 300s
_scriptHandle = [] spawn {
    while {true} do {
        _message = format["Aktuelle Tickets: %1", 
            tf47_core_ticketsystem_tickets];
        ["tf47_core_ticketStatus",[_message]] remoteExecCall
            ["BIS_fnc_showNotification", 0];
        sleep 300;
    };
};

[10, 0, objNull, tf47_core_ticketsystem_missionName] 
    call tf47_core_ticketsystem_fnc_insertTicketlog;

addMissionEventHandler ["Ended",{ 
    if((["win", _this] call BIS_fnc_inString)) then {
        [11, 0, objNull, "Mission gewonnen"] 
            call tf47_core_ticketsystem_fnc_insertTicketlog;
    };
}];