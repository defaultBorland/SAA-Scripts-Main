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

respawnTickets = 0;
respawnTime = getNumber (missionConfigFile >> "respawnDelay");
respawnEnabled = true;
reservedTickets = 0;
reservedIDs = [];
teleportIDs = [];