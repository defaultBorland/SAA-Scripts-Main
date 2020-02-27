// On Player Killed Handler

//Player killed event handler
"playerKilled" addPublicVariableEventHandler {
	_pcid = owner (_this select 1 select 0);
	_uid = _this select 1 select 1;

	// If player was a Zeus - set respawn time at 3 seconds
	if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {
		{setPlayerRespawnTime 3} remoteExec ["call", _pcid];
	};

	// If respawn disabled - set respawn time to 9999 (infinite), otherwise set server respawn time if tickets availiable 
	if !(respawnEnabled) then {[9999] remoteExec ["setPlayerRespawnTime", _pcid]}
	else {
		if !(missionNamespace getVariable (format["respawnEnabled_%1", _uid])) then {[9999] remoteExec ["setPlayerRespawnTime", _pcid]}
		else {
			if !(reservedTickets < respawnTickets) then {[9999] remoteExec ["setPlayerRespawnTime", _pcid]}
			else {
				reservedTickets = reservedTickets + 1;
				reservedIDs pushBackUnique _pcid;
				[respawnTime] remoteExec ["setPlayerRespawnTime", _pcid];
			};
		};
	};
};