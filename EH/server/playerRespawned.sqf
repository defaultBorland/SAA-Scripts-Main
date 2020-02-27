// On Player Respawned Handler

//Player respawn event handler
"playerRespawned" addPublicVariableEventHandler {
	_unit = _this select 1 select 0;
	_pcid = owner _unit;
	_uid = _this select 1 select 1;
	
	// Teleport player into FOB or nearby
	[_unit] call Shadec_fnc_respawnTeleport;

	// Free reserved slot and disable respawn if tickets run out
	if (_pcid in reservedIDs) then {
		respawnTickets = respawnTickets - 1;
		reservedTickets = reservedTickets - 1;
		reservedIDs = reservedIDs - [_pcid];

		if (reservedTickets < 0) then {reservedTickets = 0};
		if (respawnTickets < 1) then {
			[["0 TICKETS REMAINING! NO RESPAWNS!", "Plain", 2]] remoteExec ["cutText"];
			["Tickets run out. Respawn disabled."] remoteExec ["systemChat"];
			respawnEnabled = false;
		};
	};

	// Safety line
	if (reservedIDs isEqualTo []) then {reservedTickets = 0};
};