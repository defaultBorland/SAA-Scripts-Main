// Server-side only
params[""];

if (!isDedicated) exitWith {diag_log "fnc_whitelistMod | Server only function"};

private _mods = ["getBlacklistedMods"] call Shadec_fnc_call_db;

_mods