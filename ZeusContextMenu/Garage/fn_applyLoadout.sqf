params ["_vehicle", "_loadout"];

diag_log format ["fnc_applyLoadout | _vehicle: %1 | _loadout: %2", _vehicle, _loadout];

private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _loadout;

//return
true