params ["_addonInfo"];

private _allAddons = allAddonsInfo apply {[_x # 0, _x # 1]};
private _index = _allAddons findIf {_x isEqualTo _addonInfo};
if (_index < 0) exitWith {""};

getLoadedModsInfo # (allAddonsInfo # _index # 3) # 0