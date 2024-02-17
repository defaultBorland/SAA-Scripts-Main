// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_updateConnectionRecord | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_uid"];

private _mission = missionNamespace getVariable "MissionID";
if (isNil {_mission}) exitWith {
	["fnc_updateConnectionRecord | ERROR: MissionID is nil!" ,"Warning"] call Shadec_fnc_createLogServer;
};
	
"Extdb3" callExtension format ["0:%1:updateConnectionRecord:%2:%3", PROTOCOL, _uid, _mission];