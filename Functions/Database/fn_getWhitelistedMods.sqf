// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_whitelistMod | Server only function"};

private _mods = ["getWhitelistedMods"] call Shadec_fnc_call_db;

_mods