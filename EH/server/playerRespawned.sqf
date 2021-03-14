// On Player Respawned Handler

//Player respawn event handler
"playerRespawned" addPublicVariableEventHandler {
	_unit = _this select 1 select 0;
	_pcid = owner _unit;
	_uid = _this select 1 select 1;

	_remainingTickets = [side _unit, 0] call BIS_fnc_respawnTickets;

	if (_remainingTickets isEqualTo 0) then {
		[format["> Server: %1 side tickets run out!"], toUpper str(side _unit)] remoteExec ["systemChat", -2];
	};
};