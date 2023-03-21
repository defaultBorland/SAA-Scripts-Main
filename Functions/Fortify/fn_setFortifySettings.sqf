params ["_side", "_preset", "_budget"];

missionNamespace setVariable ["SAA_fortify_isSettingsSet", true, true];

_side = [_side] call ace_fortify_fnc_parseSide;
[_side, _budget, _preset] call ace_fortify_fnc_registerObjects;