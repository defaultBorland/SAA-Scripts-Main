// Client-side only
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

params ["_unit"];

private _uid = getPlayerUID _unit;

[_uid,_unit] remoteExec ["Shadec_db_server_fnc_loadStorage", 2];

true