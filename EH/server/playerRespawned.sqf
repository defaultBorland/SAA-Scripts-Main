// On Player Respawned Handler

//Player respawn event handler
"playerRespawned" addPublicVariableEventHandler {
	(_this # 1) params ["_unit", "_uid"];
	_pcid = owner _unit;

	_remainingTickets = [side _unit, 0] call BIS_fnc_respawnTickets;

	if (_remainingTickets isEqualTo 0) then {
		[format["> Server: %1 side tickets run out!"], toUpper str(side _unit)] remoteExec ["systemChat", -2];
	};
};