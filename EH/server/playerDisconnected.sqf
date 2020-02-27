// On Player Disconnected Handler

//Player disconnected handler with _unit passed
_EH_PlayerDisconnected = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	_unit = _this select 0;
	_pcid = _this select 1;
	_uid = _this select 2;
	_pname = _this select 3;

	// If player (not zeus) disconnected while been alive - subtract 1 ticket
	if (alive _unit) then {
		if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {};
		if (respawnTickets > 0) then {respawnTickets = respawnTickets - 1};
	};

	// if (_uid in (missionNamespace getVariable "ZeusArray")) then {[objNull, "flush"] call Shadec_fnc_manageCurators};

	// If player equipment didn't load for some reason - don't save
	_loadoutLoaded = missionNamespace getVariable [format["loadoutLoaded_%1", _uid], false];
	if (_loadoutLoaded) then {
		[_unit, _uid, _pname] spawn Shadec_fnc_savePlayer;
		[_uid] spawn Shadec_fnc_deleteStorage;	
	} else {
		diag_log format ["Loadout not loaded, abort player saving: %1", _name];
	};

	missionNamespace setVariable [format["loadoutLoaded_%1", _uid], nil, true];
	[format["%1 disconnected | Respawn tickets remaining: %2", _pname, respawnTickets]] remoteExec ["systemChat"];
	false;
}];

//Player disconnected handler with _owner passed
_EH_PlayerDisconnected = addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	
	// If player disconnected while waiting respawn - clear reserved slot and reserved ticket
	if (_owner in reservedIDs) then {
		reservedIDs = reservedIDs - [_owner];
		reservedTickets = reservedTickets - 1;
		if (respawnTickets > reservedTickets) then {respawnTickets = respawnTickets - 1};

		// If there are more dead players who wait respawn - give it them!
		["All", "Enable", "Nobody"] call Shadec_fnc_changeRespawnState;
	};
	
	// If player was in teleport queue - clear slot
	if (_owner in teleportIDs) then {teleportIDs = teleportIDs - [_owner]};
	if (reservedIDs isEqualTo []) then {reservedTickets = 0};
}];