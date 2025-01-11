// On Player Killed Handler

//Player killed event handler
"playerKilled" addPublicVariableEventHandler {
	(_this # 1) params ["_unit", "_uid"];

	// If player was a Zeus - instant respawn
	if (_unit getVariable ["SAA_isZeus", false]) exitWith {
		{setPlayerRespawnTime 0; ["SAA_PlayerDeath", 1, false] call ace_common_fnc_setHearingCapability} remoteExec ["call", _unit];
	};

	// Adjust respawn time
	// [_unit] call Shadec_fnc_getRespawnTimeDB;

	private _players = [] call Shadec_fnc_getPlayers; // Get non-zeus players
	if ((_players select {alive _x}) isEqualTo []) then {
		private _zeuses = allPlayers select {_x getVariable ["SAA_isZeus", false]}; // Get only SAA-zeus players
		{ // Display message to every zeus about wipe out
			{titleText [format["<t color='#ff0000' size='1.5' align='center' valign='middle' font='PuristaBold'>%1</t>", localize "STR_SAA_DEBRIEFING_ALL_DEAD_SUBTITLE"], "PLAIN", 2, true, true]} remoteExec ["call", _x];
		} forEach _zeuses;
	};
};