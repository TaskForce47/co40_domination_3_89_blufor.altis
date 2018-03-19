/**
 *  @author Willard
 *  @description
 *  calls, executes the config
 *  @params none
 *  @return nothing
 */
// call and execute config
call compileFinal preprocessFileLineNumbers "TF47VehicleSpawnerConfig.sqf";

// get all markers
tf47_modules_vs_config_allMarkers = [];
{
	tf47_modules_vs_config_allMarkers pushBack (_x select 0);
} forEach tf47_modules_vs_config;

publicVariable "tf47_modules_vs_config_allMarkers";