// Connect to database
[] execVM "Functions\Database\connectDB.sqf";

// Init Zeus
[] execVM "initZeus.sqf";

// Execute EHs
[] execVM "EH\server\playerConnected.sqf";
[] execVM "EH\server\playerDisconnected.sqf";
[] execVM "EH\server\playerKilled.sqf";
[] execVM "EH\server\playerRespawned.sqf";

// Define variables
missionNamespace setVariable ["tf_reciveVar", 1, true];
missionNamespace setVariable ["tf_sendVar", 1, true];

missionNamespace setVariable ["ServerMods", [] call Shadec_fnc_getModList, true];

{deleteMarker _x} forEach (allMapMarkers select {"respawn" in _x});
respawnTime = getNumber (missionConfigFile >> "respawnDelay");
missionNamespace setVariable ["respawnTime", respawnTime, true];

"debug_console" callExtension ("Server Console Extention Initialization..." + "#1110");
"f5znFms2" serverCommand "#monitords 60";

{ // Nulify respawn tickets for each side
	[_x, 1] call BIS_fnc_respawnTickets;
	[_x, -1] call BIS_fnc_respawnTickets;
} forEach [west, east, independent, civilian];