// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", _fnc_scriptName]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};
if (missionNamespace getVariable ["SAA_missionEnded", false]) exitWith {false};

params ["_groupid", "_uid"];

private _mission = missionNamespace getVariable "MissionID";
if (isNil {_mission}) exitWith {
	[format["%1 | ERROR: MissionID is nil!", __FILE_NAME__], "Warning"] call Shadec_fnc_createLogServer;
	false
};

"Extdb3" callExtension format ["0:%1:startCommanding:%2:%3:%4", PROTOCOL, _groupid, _uid, _mission];

true