// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_createDeadRecord | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_uid", "_name", "_inventory"];

"Extdb3" callExtension format ["0:%1:createDeadRecord:%2:%3:%4", PROTOCOL, _uid, _name, _inventory];