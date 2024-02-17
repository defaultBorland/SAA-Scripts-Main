// Client-side only
if (!hasInterface) exitWith {diag_log "fnc_saveModlist | Local only function"};

private _modlist = [] call Shadec_fnc_getModList;

[player, _modlist] remoteExec ["Shadec_db_server_fnc_saveModlist", 2];

true