// Connect to database
[] execVM "Functions\Database\connectDB.sqf";

// Init Zeus
[] execVM "initZeus.sqf";

// Execute EHs
[] execVM "EH\server\playerConnected.sqf";
[] execVM "EH\server\playerDisconnected.sqf";
[] execVM "EH\server\playerKilled.sqf";
[] execVM "EH\server\playerRespawned.sqf";
[] execVM "EH\server\groupCreated.sqf";

// Define variables
missionNamespace setVariable ["tf_reciveVar", 1, true];
missionNamespace setVariable ["tf_sendVar", 1, true];
missionNamespace setVariable ["ServerMods", [] call Shadec_fnc_getModList, true];
respawnTime = getNumber (missionConfigFile >> "respawnDelay");
missionNamespace setVariable ["respawnTime", respawnTime, true];

[{
	["getGarageVehicles", []] call Shadec_fnc_call_db;
	[] call Shadec_fnc_createMissionDB;
}, [], 3] call CBA_fnc_waitAndExecute;

{deleteMarker _x} forEach (allMapMarkers select {"respawn" in _x});

{ // Nulify respawn tickets for each side
	[_x, 1] call BIS_fnc_respawnTickets;
	[_x, -1] call BIS_fnc_respawnTickets;
} forEach [west, east, independent, civilian];

["Server Console Extention Initialization..."] call Shadec_fnc_createLogServer;
"f5znFms2" serverCommand "#monitords 60";
"f5znFms2" serverCommand "#shutdownaftermission";

// Disable writes to DB (not reads)
missionNamespace setVariable ["isDebug", true, true];
["Warning! Debug Session Enabled. No saving!", "Warning"] call Shadec_fnc_createLogServer;

// Timed Players Saving
[] spawn {
	while {true} do {
		sleep (10 * 60);
		if !(missionNamespace getVariable ["SAA_PlayersTimedSaving", true]) exitWith {};
		private _players = ["All", "Id"] call Shadec_fnc_usersIDs;
		if (count _players < 1) then { continue };
		{
			{
				[player] call Shadec_fnc_savePlayer;
			} remoteExec ["call", _x];
		} forEach _players;
		["Players data saving...", "Info"] call Shadec_fnc_createLogServer;
	};
};

// Auto Transfer Server bots to HC
[] spawn {
	while {true} do {
		sleep (0.5 * 60);
		if !(missionNamespace getVariable ["SAA_AutoTransferToServer", true]) exitWith {};
		private _serverGroups = allGroups select {
			private _group = _x;
			(count units _group) isEqualTo ({_x isKindOf "Man"} count units _group) &&
			(count units _group) isEqualTo ({!isPlayer _x} count units _group) &&
			groupOwner _group isEqualTo 2
		};
		if (count _serverGroups < 1 || (call Shadec_fnc_determineBestOwner) isEqualTo 2) then { continue };
		{
			[_x] call Shadec_fnc_transferGroupOwnership;
		} forEach _serverGroups;
	};
};