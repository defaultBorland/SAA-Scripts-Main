// On Player Killed Handler

//Player killed event handler
"playerKilled" addPublicVariableEventHandler {
	(_this # 1) params ["_unit", "_uid"];
	private _pcid = owner _unit;

	// If player was a Zeus - set respawn time at 3 seconds
	if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith { // Replace with unit getVar isZeus?
		{setPlayerRespawnTime 3} remoteExec ["call", _pcid];
	};

	private _players = ["all", "object"] call Shadec_fnc_usersIDs; // Get non-zeus players
	if ((_players select {alive _x}) isEqualTo []) then {
		private _zeuses = allPlayers - _players; // Get only SAA-zeus players
		{ // Display message to every zeus about wipe out
			{titleText [format["<t color='#ff0000' size='1.5' align='center' valign='middle' font='PuristaBold'>%1</t>", localize "STR_SAA_DEBRIEFING_ALL_DEAD_SUBTITLE"], "PLAIN", 2, true, true]} remoteExec ["call", _x];
		} forEach _zeuses;
	};
};