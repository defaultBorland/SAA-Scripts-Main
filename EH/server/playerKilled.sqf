// On Player Killed Handler

//Player killed event handler
"playerKilled" addPublicVariableEventHandler {
	_pcid = owner (_this select 1 select 0);
	_uid = _this select 1 select 1;

	// If player was a Zeus - set respawn time at 3 seconds
	if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {
		{setPlayerRespawnTime 3} remoteExec ["call", _pcid];
	};
};