// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_endType"];

["Mission ending started...", "Info"] call Shadec_fnc_createLogServer;

private _players = allPlayers - entities "HeadlessClient_F";
{
	[getPlayerUID _x] call Shadec_db_server_fnc_updateConnectionRecord;

	[[_forEachIndex], {
		params["_forEachI"];

		if (player getVariable ["SAA_isZeus", false]) exitWith {};
		if (player getVariable ["SAA_isGuest", false]) exitWith {};

		if (dialog) then {closeDialog 602; true};

        [player, getPlayerUID player, "Mission end"] call Shadec_db_client_fnc_saveInventory;
        [getPlayerUID player, "Mission end"] call Shadec_db_client_fnc_saveStorage;
		[] call Shadec_fnc_savePlayerRadioSettings;
		player setVariable ["SAA_endMissionSavingDone", true, true];

		[format["%1 was saved...", name player]] call Shadec_fnc_createLogServer;
	}] remoteExec ["spawn", _x];

} forEach _players;

["SAA_MissionEnded", []] call CBA_fnc_serverEvent;

missionNamespace setVariable ["SAA_missionEnded", true, true];

[] call Shadec_db_server_fnc_endMission;
[] call Shadec_db_server_fnc_setParticipationZeus;

//
[_players, _endType] spawn {
	params ["_players", "_endType"];

	private _startTime = serverTime;
	// wait untill all players are saved for 3 seconds max
	waitUntil {
		({_x getVariable ["SAA_endMissionSavingDone", false]} count _players) isEqualTo (count _players)
		|| {serverTime - _startTime > 3}
	};

	[format["All players saved in %1 seconds...", (serverTime - _startTime) min 3], "Debug"] call Shadec_fnc_createLogServer;
	/////

	// А если не успеет всех обработать?
	[] call Shadec_Pythia_fnc_processParticipation;

	["Mission ended.", "Info"] call Shadec_fnc_createLogServer;

	_endType call BIS_fnc_endMissionServer;

	// А если не успеет синхронизироваться до конца миссии? (Наверное без разницы с точки зрения факта синхронизации, проблема только в записи результата синхронизации в бд)
	[] call Shadec_Pythia_fnc_syncMariaDbToSupabase;
};

// Возможно стоит сделать локальное окончание игры для игроков и продолжить обработку дальше, после чего уже завершать миссию на сервере?
// Тогда стоит как-то ограничить игрокам возможность заново зайти и зареспавниться, вероятно стоит их кикать и закрывать сервер