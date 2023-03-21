params ["_name"];

private _fortifyLocationsInfo = missionNamespace getVariable ["SAA_fortify_locations", []];
private _locations = missionNamespace getVariable ["ace_fortify_locations", []];

if (_fortifyLocationsInfo isEqualTo [] || {_locations isEqualTo []}) exitWith {diag_log format ["fnc_removeFortifyArea | ERROR: No locations registered!"]};

private _index = _fortifyLocationsInfo findIf {(_x # 0) isEqualTo _name};
if (_index < 0) exitWith {diag_log format ["fnc_removeFortifyArea | ERROR: No location with provided name: %1!", _name]};

_fortifyLocationsInfo deleteAt _index;
_locations deleteAt _index;

private _visibleAreas = player getVariable ["SAA_fortify_visibleLocations", []];
if (_name in _visibleAreas) then {_visibleAreas = _visibleAreas - [_fortifyLocationsNames # _forEachIndex]};
player setVariable ["SAA_fortify_visibleLocations", _visibleAreas];

missionNamespace setVariable ["SAA_fortify_locations", _fortifyLocationsInfo, true];
missionNamespace setVariable ["ace_fortify_locations", _locations, true];

true