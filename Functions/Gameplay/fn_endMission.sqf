params ["_endType"];
_endtype = _this # 0;
switch (_endType) do {
	case "Win": {_endType = "Win"};
	case "Lose": {_endType = "Lose"};
	case "To Be Continued": {_endType = "toBeContinued"};
	case "All Dead": {_endType = "allDead"};
	default {_endType = "EveryoneWon"};
};

{
	[_x, getPlayerUID _x, name _x] spawn Shadec_fnc_savePlayer;
	[getPlayerUID _x] spawn Shadec_fnc_saveStorage;
	diag_log format["PLAYER FINISHED:%1", _x];
} forEach allPlayers;

_endType call BIS_fnc_endMissionServer;