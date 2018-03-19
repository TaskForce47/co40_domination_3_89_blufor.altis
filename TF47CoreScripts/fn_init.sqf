
// build config
call compileFinal preprocessFileLineNumbers "TF47CoreScriptsConfig.sqf";

// init
[] call tf47_core_fnc_initDatabase;
[] call tf47_core_fnc_initTicketsystem;

addMissionEventHandler ["PlayerViewChanged", {
	diag_log _this;
	if(!isNull (_this select 5)) then {
		_uav = (_this select 5);
		[_this select 1, _uav, true] remoteExecCall 
			["tf47_core_whitelist_fnc_checkWhitelistUav", 2];
	
		// Save the last effective UAV Commander
		_playerArmaId = getPlayerUID (_this select 0);
		if(_playerArmaId == "_SP_PLAYER_") then {
            _playerArmaId = "76561198022749433";
        };
		missionNamespace setVariable 
        	[format ["tf47_core_ticketsystem_lastDriver_%1", 
        	(_uav call BIS_fnc_netId)], _playerArmaId, true];
	};
}];

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit","_id","_uid","_name"];
	_amount = missionNamespace getVariable 
		[format ["tf47_core_ticketsystem_cost_%1", 
        (_unit call BIS_fnc_netId)], 0];

  	if(_unit getVariable ["ace_isunconscious", false]) then {
    	[[_name, _uid], 3, _amount] remoteExecCall 
			["tf47_core_ticketsystem_fnc_changeTickets", 2];
  	};
}];