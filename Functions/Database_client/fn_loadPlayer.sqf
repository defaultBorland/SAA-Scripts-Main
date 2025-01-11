// Client-side only
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

params ["_unit"];

if (_unit getVariable ["SAA_isZeus", false]) exitWith {
    [[_unit, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
    false
};

private _uid = getPlayerUID _unit;

[_uid, _unit] remoteExec ["Shadec_db_server_fnc_loadPlayer", 2];

true