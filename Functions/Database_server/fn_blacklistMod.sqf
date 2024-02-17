// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_blacklistMod | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};
		
params ["_modName", "_modWorkshopId", "_modHash", "_initiator_name"];

"Extdb3" callExtension format ["1:%1:blacklistMod:%2:%3:%4:%5", PROTOCOL, _modName, _modWorkshopId, _modHash, _initiator_name];

true