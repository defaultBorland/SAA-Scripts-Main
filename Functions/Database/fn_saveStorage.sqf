params["_uid"];

if (missionNamespace getVariable ["isDebug", false]) exitWith {};

if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {}; // Player is Zeus
if !(missionNamespace getVariable (format["loadoutLoaded_%1", _uid])) exitWith {}; // Loadout not properly loaded in case of crash or something
if (((missionNamespace getVariable (format["%1_DATA", _uid])) # 0) isEqualTo "GUEST") exitWith {}; // Player is Guest with static loadout

private _pStorage = missionNamespace getVariable (format["pStorage_%1", _uid]);
if ((isNil {_pStorage}) or (_pStorage isEqualTo objNull)) exitWith {diag_log format["fnc_saveStorage | Error [%1]: Trying to save Storage that unaccessible", _uid]; false};
private _weapons = ["Weapons", getWeaponCargo _pStorage] call Shadec_fnc_getCargoCompat;
private _magazines = ["Magazines", magazinesAmmoCargo _pStorage] call Shadec_fnc_getCargoCompat;
private _items = ["Items", getItemCargo _pStorage] call Shadec_fnc_getCargoCompat;
private _data = [_weapons, _magazines, _items];

// Saving Storage inventory to local profile to show in ShopMission
profileNamespace setVariable ["SAA_Project_Storage", _data];

[["saveStorage", [_uid, _data]], Shadec_fnc_call_db] remoteExec ["spawn", 2];

//return
true