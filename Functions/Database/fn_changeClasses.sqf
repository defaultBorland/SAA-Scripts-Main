params ["_unit", "_uid", "_firstClass", "_secondClass"];

[_unit, _uid, "Unassign"] call Shadec_fnc_rolesAssign;
["changeClasses", [_uid, _firstClass, _secondClass]] spawn Shadec_fnc_call_db;
[_unit, _uid, "Assign"] call Shadec_fnc_rolesAssign;