//
params ["_container"];

private _inventory = [
	["Weapons", getWeaponCargo _container] call Shadec_fnc_getCargoCompat,
	["Magazines", magazinesAmmoCargo _container] call Shadec_fnc_getCargoCompat,
	["Items", getItemCargo _container] call Shadec_fnc_getCargoCompat,
	["Backpacks", getBackpackCargo _container] call Shadec_fnc_getCargoCompat
];

// return
_inventory