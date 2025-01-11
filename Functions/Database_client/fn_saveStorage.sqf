// Client-side only
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

params ["_uid"];

if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {false}; // Player is Zeus
if !(missionNamespace getVariable (format["loadoutLoaded_%1", _uid])) exitWith {false}; // Loadout not properly loaded in case of crash or something
if (missionNamespace getVariable [format["SAA_isGuest_%1", _uid], false]) exitWith {false}; // Player is Guest with static loadout

private _storageInventory = [_uid] call Shadec_fnc_getStorageInventory;
if (_storageInventory isEqualTo false) exitWith {diag_log format["fnc_getStorageInventory | Error: Trying to save Storage that unaccessible: %1", _uid]; false};

// Saving Storage inventory to local profile to show in ShopMission
profileNamespace setVariable ["SAA_Project_Storage", _storageInventory];

[_uid, _storageInventory] remoteExec ["Shadec_db_server_fnc_saveStorage", 2];

//return
true