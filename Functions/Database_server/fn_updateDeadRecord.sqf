// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_updateDeadRecord | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_uid"];

"Extdb3" callExtension format ["0:%1:updateDeadRecord:%2", PROTOCOL, _uid];