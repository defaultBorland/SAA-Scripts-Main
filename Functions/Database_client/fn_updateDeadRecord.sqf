// Client-side only
if (!hasInterface) exitWith {diag_log "fnc_updateDeadRecord | Local only function"};

params ["_unit"];

private _uid = getPlayerUID _unit;

[_uid] remoteExec ["Shadec_db_server_fnc_updateDeadRecord", 2];

true