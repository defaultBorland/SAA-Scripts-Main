// Client-side only
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

private _modlist = [] call Shadec_fnc_getModList;

[player, _modlist] remoteExec ["Shadec_db_server_fnc_saveModlist", 2];

true