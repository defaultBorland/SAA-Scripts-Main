params ["_vehicle", "_loadout"];
_loadout params ["_gunnerMags", "_pylons"];

if (_gunnerMags isNotEqualTo []) then {
	{ _vehicle removeMagazinesTurret [_x, [0]] } forEach (_vehicle magazinesTurret [0]);
	{ _vehicle addMagazineTurret [_x, [0]] } forEach _gunnerMags;
};

if (_pylons isNotEqualTo []) then {
	{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
	{ _vehicle setPylonLoadout [_x # 0, _x # 1, true, _x # 2] } forEach _pylons;
};

//return
true