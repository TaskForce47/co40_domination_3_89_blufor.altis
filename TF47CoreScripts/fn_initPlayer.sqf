/**
 *  @author Willard
 *  @description
 *  Inserts new player ids into the Database, determines the slot cost and
 *  handles the killed event
 *  @params none
 *  @return nothing
 */
_result = _this params [
    ["_player", objNull, [objNull]]
];

if(!isServer) exitWith {
    ["initPlayer not called on the server!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// determine slot and player id
_slotString = str _player;


_playerId = getPlayerUID _player;

// In sp we use Willard's player id
if(_playerId == "_SP_PLAYER_") then {
    _playerId = "76561198022749433";
};

waitUntil{(name _player) != "Error: No unit"};
// not contains hc
if(!(["HC", str _playerId] call BIS_fnc_inString)) then {
    _name = name _player;
    // get the DB player_id with the arma player id
    _queryResult = "extDB3" callExtension
        format["0:SQL:getPlayerNameByPlayerId:%1", _playerId];

    // if no result is found insert the new player, if a result is found,
    // check if the name has changed and change it if it's the case
    _result = (call compile _queryResult) select 1;
    if((typeName _result) == "ARRAY") then {
        if((count _result) == 0) then {
            _queryResult = "extDB3" callExtension
                format["0:SQL:insertPlayerName:%1:%2", _playerId, _name];
        } else {
            _oldName = (_result select 0) select 0;
            if(_name != _oldName) then {
                _queryResult = "extDB3" callExtension
                    format["0:SQL:updatePlayerName:%1:%2", _oldName, _playerId];
            };
        };
    } else {
        ["initPlayer recieved malformed sql result!", "Error", true] spawn
            BIS_fnc_guiMessage;
    };
};

// determine slot cost
_slotCost = 0;
{
  if((_x select 0) == _slotString) then {
      _slotCost = (_x select 1);
  };
} foreach tf47_core_ticketsystem_slotCost;

// set default cost
if(_slotCost == 0) then {
    _slotCost = tf47_core_ticketsystem_defaultTickets;
};

// save the cost
missionNamespace setVariable 
        [format ["tf47_core_ticketsystem_cost_%1", 
        (_player call BIS_fnc_netId)], _slotCost, true];
//_player setVariable ["tf47_core_ticketsystem_cost", _slotCost, true];

[_player, {
    _pl = _this;
    _pl addEventHandler ["Killed", {
        _killedPlayer = _this select 0;
        [_killedPlayer, 3] remoteExecCall 
            ["tf47_core_ticketsystem_fnc_changeTickets", 2];
    }];
}] remoteExecCall ["bis_fnc_call", _player];