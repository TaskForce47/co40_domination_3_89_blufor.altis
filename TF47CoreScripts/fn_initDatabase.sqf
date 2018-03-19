/**
 *  @author Willard
 *  @description
 *  Loads the prepared statements
 *  @params none
 *  @return nothing
 */
if(!isServer) exitWith {
    ["initDatabase not called on the server!", "Error", true] spawn
        BIS_fnc_guiMessage;
};
if(("extDB3" callExtension "9:VERSION") == "") then {
    [] spawn {
        ["Missing extension: extDB3!", "Error", true] call
            BIS_fnc_guiMessage;
        diag_log "Missing extension: extDB3!";
        diag_log "Ending mission!";
        ["loser", false, true] remoteExecCall
            ["BIS_fnc_endMission"];
    };
};

"extDB3" callExtension "9:RESET";
// add the prepared statements
_addDbResult = "extDB3" callExtension "9:ADD_DATABASE:Database";
_addProtocolResult = "extDB3" callExtension
    "9:ADD_DATABASE_PROTOCOL:Database:SQL_CUSTOM:SQL:corescripts.ini";

// check if it worked
if(((call compileFinal _addDbResult) select 0) != 1 or
    ((call compileFinal _addProtocolResult) select 0) != 1) then {
        ["initDatabase could not add the required protocols!", "Error", 
            true] spawn
            BIS_fnc_guiMessage;
};
