params ["_uid"];

private _pStorage = missionNamespace getVariable (format["pStorage_%1", _uid]);
if ((isNil {_pStorage}) or (_pStorage isEqualTo objNull)) exitWith {diag_log format["fnc_getStorageInventory | Error: Trying to save Storage that unaccessible: %1", _uid]; false};

private _weapons = ["Weapons", getWeaponCargo _pStorage] call Shadec_fnc_getCargoCompat;
private _magazines = ["Magazines", magazinesAmmoCargo _pStorage] call Shadec_fnc_getCargoCompat;
private _items = ["Items", getItemCargo _pStorage] call Shadec_fnc_getCargoCompat;

[_weapons, _magazines, _items]