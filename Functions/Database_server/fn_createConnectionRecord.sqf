// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_createConnectionRecord | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_uid", "_name"];

private _mission = missionNamespace getVariable "MissionID";
if (isNil {_mission}) exitWith {
	["fnc_createConnectionRecord | ERROR: MissionID is nil!" ,"Warning"] call Shadec_fnc_createLogServer;
};

"Extdb3" callExtension format ["0:%1:createConnectionRecord:%2:%3:%4", PROTOCOL, _uid, _name, _mission];