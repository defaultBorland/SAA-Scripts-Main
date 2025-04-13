// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

params ["_uid", "_name", "_inventory"];

"Extdb3" callExtension format ["0:%1:createDeadRecord:%2:%3:%4", PROTOCOL, _uid, _name, _inventory];

true