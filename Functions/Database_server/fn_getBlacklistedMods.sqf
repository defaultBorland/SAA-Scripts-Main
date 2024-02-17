// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_getBlacklistedMods | Server only function"};

private _return = "Extdb3" callExtension format ["0:%1:getBlacklistedMods", PROTOCOL];
private _mods = [_return] call Shadec_db_server_fnc_processExtensionReturn;
if !(isNil {_mods}) then {
    if (true) exitWith { _mods };
} else {
    if (true) exitWith { [] };
};