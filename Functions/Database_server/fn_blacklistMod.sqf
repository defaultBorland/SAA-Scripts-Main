// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["isDebug", false]) exitWith {false};
		
params ["_modName", "_modWorkshopId", "_modHash", "_initiator_name"];

"Extdb3" callExtension format ["1:%1:blacklistMod:%2:%3:%4:%5", PROTOCOL, _modName, _modWorkshopId, _modHash, _initiator_name];

true