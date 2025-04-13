// Client-side only
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

params ["_unit", "_uid", "_context"];

if (_unit getVariable ["SAA_isZeus", false]) exitWith {diag_log "This is Zeus, abort saving."; false};
if !(missionNamespace getVariable (format["loadoutLoaded_%1", _uid])) exitWith {false};
if (_unit getVariable ["SAA_isGuest", false]) exitWith {false};

private _inventory = getUnitLoadout _unit;

// Saving Inventory to local profile to show in ShopMission
profileNamespace setVariable ["SAA_Project_Inventory", _inventory];

[_uid, _inventory, _context] remoteExec ["Shadec_db_server_fnc_saveInventory", 2];

true