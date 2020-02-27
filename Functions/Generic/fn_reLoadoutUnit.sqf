params ["_unit", "_uid"];
_unit = _this # 0;
_uid = _this # 1;
_inventory = missionNamespace getVariable format["%1_INVENTORY", _uid];
diag_log format ["NAME: %1 | LOADOUT: %2", name _unit, _inventory];

_unit setUnitLoadout _inventory;

//return
true