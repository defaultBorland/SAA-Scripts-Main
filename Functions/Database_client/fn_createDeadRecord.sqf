// Client-side only
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

params ["_unit"];

// Needs to be on client side bc of sync issues
private _inventory = getUnitLoadout _unit;
private _uid = getPlayerUID _unit;
private _name = name _unit;

[_uid, _name, _inventory] remoteExec ["Shadec_db_server_fnc_createDeadRecord", 2];

true