params ["_object"];

if !((typeName _object) isEqualTo "OBJECT") exitWith {diag_log format ["fnc_initStorage | Error: param 1 is not object"]};
if (isNil {_object}) exitWith {diag_log format ["fnc_initStorage | Error: param 1 is nil"]};
if (_object isEqualTo objNull) exitWith {diag_log format ["fnc_initStorage | Error: param 1 is objNull"]};

_object lock true;
_object enableSimulationGlobal false;
_object allowDamage false;
[_object, -1] call ace_cargo_fnc_setSize;
_object setVariable ["ace_rearm_isSupplyVehicle", false];
[_object, true] call ace_rearm_fnc_disable;
_object setVariable ["SAA_isStorageProxy", true, true];