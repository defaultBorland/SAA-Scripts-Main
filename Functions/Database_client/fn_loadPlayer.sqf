// Client-side only
if (!hasInterface) exitWith {diag_log "fnc_loadPlayer | Local only function"};

params ["_unit"];

if (_unit getVariable ["SAA_isZeus", false]) exitWith {
    [[_unit, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
    false
};

private _uid = getPlayerUID _unit;

[_uid, _unit] remoteExec ["Shadec_db_server_fnc_loadPlayer", 2];

true