// Function to define and init SAA Zeus modules to players (ZEUSES)
private _prefixMain = "ZeusModules\";

// Main
_prefix = _prefixMain + "Main\";
{[] execVM (_prefix + _x)} forEach [
	"addShadecArsenal.sqf",
	"endMission.sqf",
	"assignStorage.sqf",
	"removeStorage.sqf",
	"playersList.sqf",
	"promoteToZeus.sqf"
];

// Radio
_prefix = _prefixMain + "Radio\";
{[] execVM (_prefix + _x)} forEach [
	"addJammingVehicle.sqf",
	"removeJammingVehicle.sqf",
	"changeSignalQuality.sqf",
	"replaceVehicleRadio.sqf"
];

// Respawn
_prefix = _prefixMain + "Respawn\";
{[] execVM (_prefix + _x)} forEach [
	"addRemoveRespawnTickets.sqf",
	"forceRespawnTimer.sqf",
	"createRespawnPoint.sqf",
	"removeRespawnPoint.sqf"
];

// Utilities
_prefix = _prefixMain + "Utilities\";
{[] execVM (_prefix + _x)} forEach [
	
];

// Utilities
// [] execVM "Functions\ZeusModules\Utilites\spawnSoldiers.sqf";
// [] execVM "Functions\ZeusModules\Utilites\clearVehicleInventory.sqf";
// [] execVM "Functions\ZeusModules\Utilites\healAllPlayers.sqf";