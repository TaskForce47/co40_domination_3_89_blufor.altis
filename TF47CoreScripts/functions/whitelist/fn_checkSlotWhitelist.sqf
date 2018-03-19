/**
 *  @author Willard
 *  @description
 *  Check if the player is whitelisted for his current slot
 *  @params 
 *      param 0: The player <object> (required)
 *  @returns nothing
 */
_result = _this params [
    ["_player", objNull, [objNull]]
];

if(!isServer) exitWith {
    ["checkSlotWhitelist not called on Server!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// get the slot name and the player id
_slotString = str _player;

_playerId = getPlayerUID _player;

// in sp we use Willard's Player id
if(_playerId == "_SP_PLAYER_") then {
    _playerId = "76561198022749433";
};

// get whitelist id
_whitelistId = 0;
{
  if((_x select 0) == _slotString) then {
      _whitelistId = (_x select 1);
  };
} foreach tf47_core_whitelistedSlots;

// no whitelist, so no need to check it
if(_whitelistId == 0) exitWith {};

// build the query and commit it
_query = format["0:SQL:checkWhitelist:%1:%2", _playerId, _whitelistId];

_queryResult = "extDB3" callExtension _query;

// if the player is not on the whitelist, kick him 
_resultArray = ((call compileFinal _queryResult) select 1);
if((count _resultArray) == 0) exitWith {
    _clientId = owner _player;
    ["tf47_core_whitelistSlotFail"] remoteExecCall
      ["BIS_fnc_endMission", _clientId];
};
