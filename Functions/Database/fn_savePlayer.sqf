params ["_unit"];

if (missionNamespace getVariable ["isDebug", false]) exitWith {};

private _uid = getPlayerUID _unit;

if (_unit getVariable ["SAA_isZeus", false]) exitWith {diag_log format ["fnc_savePlayer | This is Zeus, abort saving."]; false};
if !(missionNamespace getVariable [format["loadoutLoaded_%1", _uid], false]) exitWith {diag_log format ["fnc_savePlayer | loadoutLoaded is false, abort saving."]; false};
if ((_unit getVariable ["SAA_Rank", "PV1"]) isEqualTo "GUEST") exitWith {diag_log format ["fnc_savePlayer | This is GUEST, abort saving."]; false};

[[], Shadec_fnc_savePlayerRadioSettings] remoteExec ["call", _unit];

private _inventory = getUnitLoadout _unit;

private _pStorage = missionNamespace getVariable (format["pStorage_%1", _uid]);
if ((isNil {_pStorage}) or (_pStorage isEqualTo objNull)) exitWith {diag_log format["fnc_saveStorage | Error [%1]: Trying to save Storage that unaccessible", _uid]; false};
private _weapons = ["Weapons", getWeaponCargo _pStorage] call Shadec_fnc_getCargoCompat;
private _magazines = ["Magazines", magazinesAmmoCargo _pStorage] call Shadec_fnc_getCargoCompat;
private _items = ["Items", getItemCargo _pStorage] call Shadec_fnc_getCargoCompat;
private _storage = [_weapons, _magazines, _items];

// Saving Inventory to local profile to show in ShopMission
profileNamespace setVariable ["SAA_Project_Inventory", _inventory];

// Saving Inventory to local profile to show in ShopMission
profileNamespace setVariable ["SAA_Project_Storage", _storage];

private _name = name _unit;

private _data = [_name,_inventory, _storage, _uid];

[["saveAll", _data], Shadec_fnc_call_db] remoteExec ["spawn", 2];