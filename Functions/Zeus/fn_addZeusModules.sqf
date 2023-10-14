// Function to define and init SAA Zeus modules to players (ZEUSES)
private _prefixMain = "ZeusModules\";

// Main
_prefix = _prefixMain + "Main\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"endMission",
	"promoteToZeus"
	, "addMarkerTracking"
	, "removeMarkerTracking"
	, "toggleGPS"
];

// Arsenal
_prefix = _prefixMain + "Arsenal\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"addShadecArsenal",
	"removeShadecArsenal",
	"changeArsenalRestrictions"
];

// Radio
_prefix = _prefixMain + "Radio\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"addJammingVehicle",
	"removeJammingVehicle",
	"changeSignalQuality",
	"replaceVehicleRadio"
];

// Respawn
_prefix = _prefixMain + "Respawn\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"changeRespawnTickets",
	"forcedRespawn",
	"createRespawnPoint",
	"removeRespawnPoint"
];

// Storage
_prefix = _prefixMain + "Storage\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"assignStorage",
	"removeStorage",
	"restrictStorageAccess"
];

// Utilities
_prefix = _prefixMain + "Other\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	//"spawnUnits"
];

// Achilles
_prefix = _prefixMain + "Achilles\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	//"switchUnit",
	//"spawnExplosives"
];

// Fuel
_prefix = _prefixMain + "Fuel\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"spawnCanister",
	"setStationsFuel"
];

// Fortify
_prefix = _prefixMain + "Fortify\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"fortifyToggle",
	"fortifySettings",
	"assignSupply",
	"addFortifyArea",
	"removeFortifyArea",
	"toggleAreaVisualization"
];