/**
 *  @author Willard
 *  @description
 *  Inits the group name changer
 *  @params none
 *  @return nothing
 */
waitUntil {(ctrlText 1001) != ""};

// sets the current group name
ctrlSetText [1400, groupId (group player)];