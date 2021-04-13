//Player init
waitUntil {!isNull player};
[] call BIS_fnc_VRFadeOut;

_uid = getPlayerUID player;

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

// Wait untill loadout is loaded by server or skip if zeus
[{missionNamespace getVariable [format["loadoutLoaded_%1", _this], player getVariable ["SAA_isZeus", false]]}, {}, _uid, 30, {"somethingGoneWrong" call BIS_fnc_endMission}] call CBA_fnc_waitUntilAndExecute;
// waitUntil {missionNamespace getVariable [format["loadoutLoaded_%1", _this], player getVariable ["SAA_isZeus", false]]};

// Execute EHs
[] execVM "Mechanics\LowGear\LowGear_Init.sqf";
[] execVM "Mechanics\GroupNaming\GroupNaming_Init.sqf";
[] execVM "Mechanics\PlayersList\PlayersList_Init.sqf";
[] execVM "Mechanics\SquadList\SquadList_Init.sqf";
[] execVM "EH\player\arsenal.sqf";
[] execVM "EH\player\storage.sqf";
[] execVM "EH\player\getOut.sqf";
script_handler = [] execVM "EH\player\playerKilled.sqf";
[] execVM "EH\player\playerRespawn.sqf";
if (player getVariable ["SAA_isZeus", false]) then {
	[] execVM "EH\player\zeus.sqf";
} else {
	[] execVM "EH\player\profileSavings.sqf";
};

waitUntil {scriptDone script_handler};
// If player was KIA - kill him
if (player getVariable ["KIA_onExit", false]) then {player setDamage 1} else {
	
	script_handler = [] spawn {sleep 6; [] call BIS_fnc_VRFadeIn;};
	[{scriptDone script_handler}, {[player] call Shadec_fnc_showUserInfo}, _uid, 15, {"somethingGoneWrong" call BIS_fnc_endMission}] call CBA_fnc_waitUntilAndExecute;
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

// Remove restricted items from player inventory
while {[player, "MineDetector"] call BIS_fnc_hasItem} do {player removeItem "MineDetector"};
if !((player getVariable ["SAA_PrimaryClass", "Rifleman"]) isEqualTo "Engineer") then {
	{
		while {[player, _x] call BIS_fnc_hasItem} do {player removeItem _x};
	} forEach ["I_UavTerminal","C_UavTerminal","O_UavTerminal","B_UavTerminal"];
};

// Display removed restricted items from player storage
_itemsRemoved = missionNamespace getVariable [format["removedItems_%1", _uid], []];
if !(_itemsRemoved isEqualTo []) then {
	player addAction [localize "SAA_ACTION_REMOVEDITEMSLIST", {
		createDialog "Dialog_RemovedItemsList";
		((findDisplay 100) displayCtrl 102) ctrlSetText localize "SAA_DESCRIPTION_REMOVEDITEMSLIST_HEADER";
		((findDisplay 100) displayCtrl 103) ctrlSetText localize "SAA_DESCRIPTION_REMOVEDITEMSLIST_DESC";
		((findDisplay 100) displayCtrl 104) ctrlSetText localize "SAA_DESCRIPTION_REMOVEDITEMSLIST_HINT";
		((findDisplay 100) displayCtrl 106) ctrlSetText localize "SAA_GENERAL_HIDE";

		_ctrl = (findDisplay 100) displayCtrl 101;

		_itemsRemoved = missionNamespace getVariable [format["removedItems_%1", getPlayerUID player], []];
		[_itemsRemoved, _ctrl] call Shadec_fnc_removedItemsListDisplay;
	}];
};