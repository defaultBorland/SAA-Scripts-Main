// Disable writes to DB (not reads)
missionNamespace setVariable ["SAA_isDebug", true, true];

// Special mission setup
missionNamespace setVariable ["SAA_isMissionSpecial", false, true];
// missionNamespace setVariable ["SAA_missionSpecial_loadStorage", true, true];
// missionNamespace setVariable ["SAA_missionSpecial_processOrders", false, true];
// missionNamespace setVariable ["SAA_missionSpecial_clearTable", true, true];

// Check for HCs
if (!(missionNamespace getVariable ["SAA_isDebug", false])
	&& {count(entities "HeadlessClient_F") < 1}) exitWith {
	["No HC-entities are present in mission! Please FIX. All server scripts stopped, server locked.", "Warning"] call Shadec_fnc_createLogServer;
	"f5znFms2" serverCommand "#lock";
};

// Connect to database
[] execVM "Functions\Database_server\connectDB.sqf";

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
missionNamespace setVariable ["SAA_ServerMods", [] call Shadec_fnc_getModList, true];
missionNamespace setVariable ["SAA_SaaBoxAddons", [] call Shadec_fnc_getShadecBoxAddons, true];
missionNamespace setVariable ["respawnTime", getNumber (missionConfigFile >> "respawnDelay"), true];
missionNamespace setVariable ["ace_medical_engine_disableSeatLocking", true, true];

{deleteMarker _x} forEach (allMapMarkers select {"respawn" in _x});

{ // Nulify respawn tickets for each side
	[_x, 1] call BIS_fnc_respawnTickets;
	[_x, -1] call BIS_fnc_respawnTickets;
} forEach [west, east, independent, civilian];



["Server Console Extention Initialization..."] call Shadec_fnc_createLogServer;
"f5znFms2" serverCommand "#monitords 60";
"f5znFms2" serverCommand "#shutdownaftermission";

if (missionNamespace getVariable ["SAA_isDebug", false]) then {
	["Warning! Debug Session Enabled. No saving!", "Warning"] call Shadec_fnc_createLogServer;
};

// TODO: change to waitUntil connectDB.sfq
[{
	[] call Shadec_db_server_fnc_createMission;
	[] call Shadec_Pythia_fnc_syncSupabaseToMariaDb;
	[] call Shadec_db_server_fnc_getGarageVehicles;
}, [], 3] call CBA_fnc_waitAndExecute;


// Timed Players Saving
[] spawn {
	if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};
	while {true} do {
		sleep (10 * 60);
		if !(missionNamespace getVariable ["SAA_PlayersTimedSaving", true]) exitWith {};
		private _players = [] call Shadec_fnc_getPlayers;
		if (count _players < 1) then { continue };
		{
			{
				[player, "Timed"] call Shadec_db_client_fnc_savePlayer;
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

// Monitoring Server And Headlesses FPS, send info to clients
[] spawn {
	while {true} do {
		sleep 3;
		if !(missionNamespace getVariable ["SAA_ServerFpsMonitoring", true]) exitWith {};

		private _serverHcsFpsInfo = [true, true] call Shadec_fnc_getHeadlessInfo;
		["SAA_ServerFpsMonitoring", [_serverHcsFpsInfo]] call CBA_fnc_globalEvent;
	};
};