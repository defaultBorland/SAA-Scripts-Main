// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

params ["_uid"];

"Extdb3" callExtension format ["1:%1:updateDeadRecord:%2", PROTOCOL, _uid];

true