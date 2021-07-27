// On Player Killed Handler

//Player killed event handler
"playerKilled" addPublicVariableEventHandler {
	(_this # 1) params ["_unit", "_uid"];
	private _pcid = owner _unit;

	// If player was a Zeus - set respawn time at 3 seconds
	if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {
		{setPlayerRespawnTime 3} remoteExec ["call", _pcid];
	};
};