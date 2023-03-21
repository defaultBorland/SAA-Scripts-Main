params ["_name", "_position", "_radius"];

private _fortifyLocationsInfo = missionNamespace getVariable ["SAA_fortify_locations", []];
_fortifyLocationsInfo pushBack [_name, _position, _radius];
missionNamespace setVariable ["SAA_fortify_locations", _fortifyLocationsInfo, true];

private _locations = missionNamespace getVariable ["ace_fortify_locations", []];
_locations pushBack [_position, _radius, _radius, 0, false];
missionNamespace setVariable ["ace_fortify_locations", _locations, true];

true