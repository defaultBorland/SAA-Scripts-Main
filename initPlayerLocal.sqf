//Player init
waitUntil {!isNull player};
[] call BIS_fnc_VRFadeOut;

private _uid = getPlayerUID player;

// Check if player has World that loaded on server
if !(isClass (configFile >> "CfgWorlds" >> worldName)) exitWith {
	[(name player) + " have not loaded needed map. Kicking out."] call Shadec_fnc_createLogServer;

	[[name player], {systemChat format ["%1 %2", _this # 0, localize "STR_SAA_MESSAGE_WORLD_NOT_LOADED"]}] remoteExec ["call", -2];

	"missingMap" call BIS_fnc_endMission;
};

player setVariable ["SAA_isZeus", _uid in (missionNamespace getVariable "ZeusArray"), true];
player setVariable ["SAA_isArsenalUnrestricted", player getVariable ["SAA_isZeus", false], true];
player setVariable ["SAA_storageRestricted", player getVariable ["SAA_isZeus", false], true];

// Check if player was KIA
(missionNamespace getVariable [format["KIAonExit_%1", _uid], [false, false]]) params ["_KIAonExit", "_returnTicket"];
player setVariable ["KIA_onExit", _KIAonExit];
player setVariable ["KIA_returnTicket", _returnTicket];
diag_log format["KIA_onExit: %1 | KIA_returnTicket: %2", _KIAonExit, _returnTicket];
missionNamespace setVariable [format["KIAonExit_%1", _uid], nil, true];

if !(player getVariable ["KIA_onExit", false]) then {
	// Welcome message while loadout is loading (KIA = false)
	titleText [format["<t color='#ff0000' size='2' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", name player, "Welcome to Duty | Shadec Asgardian Alliance"], "BLACK FADED", 2, false, true];
	playMusic ["EventTrack02a_F_EPA", 3];
	sleep 3;
} else {
	// Welcome message while loadout is loading (KIA = true)
	titleText [format["<t color='#ff0000' size='2' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", name player, "Welcome Back | Loading last state..."], "BLACK FADED", 2, false, true];
	playMusic "EventTrack02_F_EPB";
	//playMusic "EventTrack03a_F_EPB";
	sleep 3;
};

// Loading player data from db or assign zeus (if uid in ZeusArray)
[player] spawn Shadec_fnc_loadPlayer;

// Add Actions
[] execVM "Mechanics\Root\RootActions_init.sqf";
[] execVM "Mechanics\Reloadout\LoadoutFix_init.sqf";

[] execVM "Mechanics\LowGear\LowGear_Init.sqf";
[] execVM "Mechanics\TeamManagement\PlayersList_Init.sqf";
[] execVM "Mechanics\TeamManagement\SquadList_Init.sqf";
[] execVM "Mechanics\TeamManagement\GroupNaming_Init.sqf";
[] execVM "Mechanics\TeamManagement\ForceJoinToSquad_Init.sqf";
[] execVM "Mechanics\TeamManagement\ForceRemoveFromSquad_Init.sqf";
[] execVM "Mechanics\ShowTickets\ShowTickets_Init.sqf";
[] execVM "Mechanics\ShowGarageVehicles\ShowGarageVehicles_Init.sqf";

// Add chat commands
[] execVM "Mechanics\ChatCommands\randomCommander.sqf";

// Execute EHs
//[] execVM "EH\player\getOut.sqf";
[] execVM "EH\player\serverFps.sqf";

if !(player getVariable ["SAA_isZeus", false]) then {
	[] execVM "EH\player\profileSavings.sqf";
	[] execVM "EH\player\arsenal.sqf";
	[] execVM "EH\player\storage.sqf";
	[] execVM "EH\player\itemsDelivered.sqf";
	[] execVM "EH\player\itemsRemoved.sqf";
};

script_handler = [] execVM "EH\player\playerKilled.sqf";
[] execVM "EH\player\playerRespawn.sqf";

waitUntil {scriptDone script_handler};
// If player was KIA - kill him
if (player getVariable ["KIA_onExit", false]) then {player setDamage 1} else {
	
	script_handler = [] spawn {sleep 6; [] call BIS_fnc_VRFadeIn;};
	[{scriptDone script_handler}, {[player] call Shadec_fnc_showUserInfo}, _uid, 30, {"somethingWentWrong" call BIS_fnc_endMission}] call CBA_fnc_waitUntilAndExecute;
};

// Saving Player Modlist to db
[] spawn Shadec_fnc_saveModlist;

// Recieve variables from server
["Check"] spawn Shadec_fnc_objectJamming; 
player setVariable ["tf_receivingDistanceMultiplicator", missionNamespace getVariable "tf_reciveVar"];
player setVariable ["tf_sendingDistanceMultiplicator", missionNamespace getVariable "tf_sendVar"];

// Delete Existing Respawn Markers if they were placed in Editor
{deleteMarker _x} forEach (allMapMarkers select {"respawn" in _x});

// Reset player group
[player] joinSilent grpNull;


//Spectator
{
	missionNamespace setVariable [_x, true];
} forEach [
	"BIS_respSpecShowHeader",			// Top bar of the spectator UI including mission time
	"BIS_respSpecLists"					// Show list of available units and locations on the left hand side
];