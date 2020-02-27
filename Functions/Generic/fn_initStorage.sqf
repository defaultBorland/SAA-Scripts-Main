params ["_object"];

if !((typeName _object) isEqualTo "OBJECT") exitWith {missionNamespace setVariable ["objectStorage", nil]};
if (isNil {_object}) exitWith {missionNamespace setVariable ["objectStorage", nil]};
if (_object isEqualTo objNull) exitWith {missionNamespace setVariable ["objectStorage", nil]};

missionNamespace setVariable ["objectStorage", _object, true];

_object lock true;
_object enableSimulationGlobal false;
_object allowDamage false;
[_object, -1] call ace_cargo_fnc_setSize;
_object setVariable ["ace_rearm_isSupplyVehicle", false];
[_object, true] call ace_rearm_fnc_disable;