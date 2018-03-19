/**
 *  @author Willard
 *  @description
 *  handles the players respawn
 *  @params 
 *      param 0: The new player unit <object> (required)
 *      param 1: The old player unit <object> (required)
 *      param 2: The respawn type <number> (required)
 *      param 3: The respawn delay <number> (required)
 *  @return nothing
 */	
params ["_newUnit","_oldUnit","_respawn","_respawnDelay"];

if(!isNull _oldUnit) then {
	// determine slot cost
	_slotCost = 0;
	{
	if((_x select 0) == (str _newUnit)) then {
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
			(_newUnit call BIS_fnc_netId)], _slotCost, true];
	//_player setVariable ["tf47_core_ticketsystem_cost", _slotCost, true];
};