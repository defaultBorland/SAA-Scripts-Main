// Client-side only
if (!hasInterface) exitWith {diag_log "fnc_loadInventory | Local only function"};

params ["_unit"];

private _uid = getPlayerUID _unit;

[_uid, _unit] remoteExec ["Shadec_db_server_fnc_loadInventory", 2];

true