//
private _index = getLoadedModsInfo findIf {(_x # 0) isEqualTo "SAABOX"};
if (_index < 0) exitWith {[]};

private _SaaBoxmods = allAddonsInfo select {(_x # 3) isEqualTo _index} apply {[_x # 0, _x # 1]};

//return
_SaaBoxmods