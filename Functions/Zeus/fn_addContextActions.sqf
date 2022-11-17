private _prefixMain = "ZeusContextMenu\";

// Garage
_prefix = _prefixMain + "Garage\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"spawnCompanyVehicles",
	"loadVehicleLoadout"
];

// Arsenal
_prefix = _prefixMain + "Arsenal\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"assignArsenal",
	"removeArsenal"
];

// Storage
_prefix = _prefixMain + "Storage\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"assignStorage",
	"removeStorage"
];

_prefix = _prefixMain + "Watch\";
{[] execVM (_prefix + _x + ".sqf")} forEach [
	"DoWatch",
	"StopWatch"
];