// Client-side only
if (!hasInterface) exitWith {diag_log "fnc_savePlayer | Local only function"};

params ["_unit"];

private _uid = getPlayerUID _unit;

if (_unit getVariable ["SAA_isZeus", false]) exitWith {diag_log format ["fnc_savePlayer | This is Zeus, abort saving."]; false};
if !(missionNamespace getVariable [format["loadoutLoaded_%1", _uid], false]) exitWith {diag_log format ["fnc_savePlayer | loadoutLoaded is false, abort saving."]; false};
if ((_unit getVariable ["SAA_Rank", "PV1"]) isEqualTo "GUEST") exitWith {diag_log format ["fnc_savePlayer | This is GUEST, abort saving."]; false};

[] call Shadec_fnc_savePlayerRadioSettings;

private _inventory = getUnitLoadout _unit;

private _storageInventory = [_uid] call Shadec_fnc_getStorageInventory;
if (_storageInventory isEqualTo false) exitWith {diag_log format["fnc_getStorageInventory | Error: Trying to save Storage that unaccessible: %1", _uid]; false};

// Saving Inventory to local profile to show in ShopMission
profileNamespace setVariable ["SAA_Project_Inventory", _inventory];

// Saving Inventory to local profile to show in ShopMission
profileNamespace setVariable ["SAA_Project_Storage", _storageInventory];

private _name = name _unit;

[_name,_inventory, _storageInventory, _uid] remoteExec ["Shadec_db_server_fnc_savePlayer", 2];

true