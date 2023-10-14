// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_whitelistMod | Server only function"};

params["_modName", "_modWorkshopId", "_modHash", "_initiator_name"];

["whitelistMod", [_modName, _modWorkshopId, _modHash, _initiator_name]] call Shadec_fnc_call_db;

true