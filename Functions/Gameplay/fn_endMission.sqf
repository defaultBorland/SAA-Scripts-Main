params ["_endType"];

{
	[_x, getPlayerUID _x, name _x] call Shadec_fnc_savePlayer;
	[getPlayerUID _x] call Shadec_fnc_saveStorage;
	diag_log format["PLAYER FINISHED:%1", _x];
} forEach allPlayers;

_endType call BIS_fnc_endMissionServer;