//Player init

// Welcome message while loadout is loading
titleText [format["<t color='#ff0000' size='2' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", name player, "Welcome Back, Soldier | Shadec Asgardian Alliance"], "BLACK FADED", 2, false, true];
playMusic ["EventTrack02a_F_EPA", 3];
waitUntil {!isNull player};
sleep 3;


// Loading player data from db or assign zeus (if uid in ZeusArray)
[player] spawn Shadec_fnc_loadPlayer;
script_handler = [] spawn {sleep 3; titleFadeOut 3;};

waitUntil { scriptDone script_handler };
_data = missionNamespace getVariable format["%1_DATA", getPlayerUID player];
[format["Somewhere on %1", worldName], format ["%1h:%2m", date select 3, date select 4], mapGridPosition player ] spawn BIS_fnc_infoText;
sleep 4;
[[format["Rank: %1", _data # 0],3,1,8], [format["Primary: %1", _data # 1],3,1,8], [format["Additional: %1", _data # 2],3,1,8]] call BIS_fnc_EXP_camp_SITREP;

// Recieve variables from server
["Check"] spawn Shadec_fnc_objectJamming; 
player setVariable ["tf_receivingDistanceMultiplicator", missionNamespace getVariable "tf_reciveVar"];
player setVariable ["tf_sendingDistanceMultiplicator", missionNamespace getVariable "tf_sendVar"];

// Execute EHs
[] execVM "Mechanics\LowGear\LowGear_Init.sqf";
[] execVM "EH\player\arsenal.sqf";
[] execVM "EH\player\storage.sqf";
[] execVM "EH\player\playerKilled.sqf";
[] execVM "EH\player\playerRespawn.sqf";