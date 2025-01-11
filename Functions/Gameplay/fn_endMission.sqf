// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_endType"];

["Mission ending started...", "Info"] call Shadec_fnc_createLogServer;

{
	[getPlayerUID _x] call Shadec_db_server_fnc_updateConnectionRecord;

	[[_forEachIndex], {	
		params["_forEachI"];

		if (player getVariable ["SAA_isZeus", false]) exitWith {};
		
		if (dialog) then {closeDialog 602; true};
		[player, "Mission end"] call Shadec_db_client_fnc_savePlayer;
		
		[format["%1 was saved...", name player]] call Shadec_fnc_createLogServer;
	}] remoteExec ["call", _x];

} forEach (allPlayers - entities "HeadlessClient_F");

["SAA_MissionEnded", []] call CBA_fnc_serverEvent;

missionNamespace setVariable ["SAA_missionEnded", true, true];

[] call Shadec_db_server_fnc_endMission;
[] call Shadec_db_server_fnc_setParticipationZeus;


["Mission ended.", "Info"] call Shadec_fnc_createLogServer;

_endType call BIS_fnc_endMissionServer;