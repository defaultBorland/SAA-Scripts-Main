//
params [""];

_addons = getLoadedModsInfo;

_modlist = _addons select {(_x # 2) isEqualTo false}; // Cut off arma 3 dlcs and default mods
_modlist = _modlist apply {[_x # 0 splitString "@:" joinString "", _x # 7, _x # 6]}; // Select names, ID (workshop/local) and shorthash of addons | Remove @ symbol from mods names and Remove : symbol from mods names (DB limitation)
_modlist sort true; // Alphabetical Sorting

// return
_modlist