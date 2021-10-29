// On Player Respawned Handler

//Player respawn event handler
"playerRespawned" addPublicVariableEventHandler {
	(_this # 1) params ["_unit", "_uid"];
	private _pcid = owner _unit;
	private _side = side _unit;

	private _remainingTickets = [_side, 0] call BIS_fnc_respawnTickets;

	if (_remainingTickets isEqualTo 0) then {
		[[_side], {
			systemChat format["> Server: %1 - %2!", toUpper localize format["SAA_GENERAL_%1", _this # 0], localize "STR_SAA_MESSAGE_SIDE_TICKETS_RUNS_OUT"];
		}] remoteExec ["call", -2];
	};
};