/**
 *  @author Willard
 *  @description
 *  Performs a ticket change, shows a notification and inserts it into
 *  the Database
 *  @params 
 *      param 0: Vehicle or Player <object>
 *      param 1: Action id <number>
 *      param 2: Ticket amount <number>
 *      param 3: Is it a ticket gain <boolean>
 *      param 4: Custom notification text <string>
 *  @return nothing
 */
_result = _this params [
    ["_object", objNull, [objNull, []]],
    ["_action", 0, [0]],
    ["_amount", 0, [0]],
    ["_positiveChange", false, [false]],
    ["_customText", "", [""]]
];


if(!isServer) exitWith { 
    ["changeTickets not called on Server!", "Error", true] spawn
        BIS_fnc_guiMessage;
 };

// default change is no change
if(_amount == 0) then {
    _amount = missionNamespace getVariable 
        [format ["tf47_core_ticketsystem_cost_%1", 
        (_object call BIS_fnc_netId)], 0];
    //_amount = _object getVariable ["tf47_core_ticketsystem_cost", 0];
};

_message = "";
_ticketMessage = "";
_notificationClass = "";
_lastDriver = objNull;
if(typeName _object == "OBJECT") then {
    // determine message type (player/object)
    if(!isNull _object) then {
        if(_object isKindOf "Man") then {
            _message = format["%1 ist gestorben!", name _object]
        } else {
            if(missionNamespace getVariable 
                [format ["tf47_core_ticketsystem_deserted_%1", 
                (_object call BIS_fnc_netId)], false]) then {
            //if(_object getVariable ["tf47_core_ticketsystem_deserted", false]) then {
                _message = format["%1 wurde zurückgelassen!", getText (configFile >>
                    "CfgVehicles" >> (typeOf _object) >> "displayName")];
            } else {
                _message = format["%1 wurde zerstört!", getText (configFile >>
                    "CfgVehicles" >> (typeOf _object) >> "displayName")];
            };
        };
    } else {
        _message = "";
    };
} else {
    _message = format["%1 ist gestorben!", _object select 0]
};
// determine positive or negative change
if(_positiveChange) then {
    _ticketMessage = "<t color='#b2ff4c'>Ticket Gewinn: </t>";
    _notificationClass = "tf47_core_ticketGain";
} else {
    _ticketMessage = "<t color='#ff4c33'>Ticket Verlust: </t>";
    _notificationClass = "tf47_core_ticketLoss";
    _amount = (-1) * _amount;
};

// build the text or set the custom text
if(_customText == "") then {
    _message = format["%1 <br/> %2 %3", _message, _ticketMessage, _amount];
} else {
    _message = _customText;
};

// check for soft/hardcap
_newTickets = tf47_core_ticketsystem_tickets + _amount;;

if(_newTickets >= tf47_core_ticketsystem_softcap) then {
    _newTickets = tf47_core_ticketsystem_softcap + 
        (((tf47_core_ticketsystem_tickets + _amount)
        - tf47_core_ticketsystem_softcap) / 2);
};

if(_newTickets > tf47_core_ticketsystem_hardcap) then {
    _newTickets = tf47_core_ticketsystem_hardcap;
};

if(!isNull tf47_core_ticketsystem_endingScript) exitWith {};

// "commit" the changed tickets
tf47_core_ticketsystem_tickets = floor _newTickets;
publicVariable "tf47_core_ticketsystem_tickets";

// insert ticket change into the db
[_action, _amount, _object] call tf47_core_ticketsystem_fnc_insertTicketlog;

// show message to all clients
[_notificationClass,[_message]] remoteExecCall
    ["BIS_fnc_showNotification", 0];

// end mission when there're no tickets left
if(tf47_core_ticketsystem_tickets <= 0) then {
    tf47_core_ticketsystem_endingScript = [] spawn {
        sleep 5;
        [12, 0, objNull, "Mission verloren"] 
            call tf47_core_ticketsystem_fnc_insertTicketlog;
        sleep 10;
        ["tf47_core_missionLost", false, true] remoteExecCall
            ["BIS_fnc_endMission"];
    };

    publicVariable "tf47_core_ticketsystem_endingScript";
};