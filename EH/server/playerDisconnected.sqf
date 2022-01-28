// On Player Disconnected Handler

//Player disconnected handler with _unit passed
_EH_PlayerDisconnected = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_pcid", "_uid", "_name"];
	
	if (missionNamespace getVariable [format["loadoutLoaded_%1", _uid], false]) then { // If player load correctly
		[_unit, _uid, _name] spawn Shadec_fnc_savePlayer;
		[_uid] spawn Shadec_fnc_deleteStorage;

		if (alive _unit) then {
			if ((_unit getvariable ["ACE_isUnconscious", false]) and alive _unit) then { // If player was Unconscious and alive (mechanics abuse)
				[[_name], {
					systemChat format["> Server: %1 %2!", _this # 0, localize "STR_SAA_MESSAGE_PLAYER_LEFT_UNCONSCIOUS"];
				}] remoteExec ["call", -2];

				"debug_console" callExtension ((_name + " disconnected while unconcsious!") + "#1001");
			};
		} else {	// If player was dead
			private _isTicketsRemain = [false, true] select (([side _unit, 0] call BIS_fnc_respawnTickets) > 0);
			missionNamespace setVariable [format["KIAonExit_%1", _uid], [true, _isTicketsRemain], true];
		};
		
	} else { // If player equipment didn't load for some reason - don't save
		diag_log format ["Loadout not loaded, abort player saving: %1", _name];
	};
	missionNamespace setVariable [format["loadoutLoaded_%1", _uid], nil, true];

	// Unlock server if no zeus or administrator present

	private _zeusesAndAdmin = (missionNamespace getVariable "ZeusArray") + ["76561198066438612"];
	private _allPlayersUIDs = allPlayers apply {getPlayerUID _x};

	if ((_zeusesAndAdmin arrayIntersect _allPlayersUIDs) isEqualTo []) then {
		"f5znFms2" serverCommand "#unlock";
	};

	false
}];

//Player disconnected handler with _owner passed
// _EH_PlayerDisconnected = addMissionEventHandler ["PlayerDisconnected", {
// 	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

	
// }];