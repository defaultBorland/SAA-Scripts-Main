params ["_endType"];

{
	[_x, getPlayerUID _x, name _x] call Shadec_fnc_savePlayer;
	[getPlayerUID _x] call Shadec_fnc_saveStorage;
	diag_log format["PLAYER FINISHED:%1", _x];
} forEach allPlayers;

"debug_console" callExtension (("Mission ended.") + "#0101");

_endType call BIS_fnc_endMissionServer;