// Function to define and init SAA Zeus modules to players (ZEUSES)
private prefix = "ZeusModules\";

{	// Main
	prefix = prefix + "Main\";
	{[] execVM (prefix + _x)} forEach [
		"addShadecArsenal.sqf",
		"endMission.sqf",
		"assignStorage.sqf",
		"removeStorage.sqf",
		"playersList.sqf",
		"promoteToZeus.sqf"
	];
};

{	// Radio
	prefix = prefix + "Radio\";
	{[] execVM (prefix + _x)} forEach [
		"addJammingVehicle.sqf",
		"removeJammingVehicle.sqf",
		"changeSignalQuality.sqf",
		"replaceVehicleRadio.sqf"
	];
};

{	// Respawn
	prefix = prefix + "Respawn\";
	{[] execVM (prefix + _x)} forEach [
		"addRemoveRespawnTickets.sqf",
		"forceRespawnTimer.sqf",
		"createRespawnPoint.sqf",
		"removeRespawnPoint.sqf"
	];
};

{	// Utilities
	prefix = prefix + "Utilities\";
	{[] execVM (prefix + _x)} forEach [
		
	];
};

// Utilities
// [] execVM "Functions\ZeusModules\Utilites\spawnSoldiers.sqf";
// [] execVM "Functions\ZeusModules\Utilites\clearVehicleInventory.sqf";
// [] execVM "Functions\ZeusModules\Utilites\healAllPlayers.sqf";