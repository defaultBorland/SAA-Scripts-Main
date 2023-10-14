// FNC EXEC LOCALLY
params [];

if !(hasInterface) exitWith {diag_log "fnc_saveModlist | Player only local function"};

private _modlist = [] call Shadec_fnc_getModList;

_data = [player, _modlist];

[["saveModlist", _data], Shadec_fnc_call_db] remoteExec ["spawn", 2];