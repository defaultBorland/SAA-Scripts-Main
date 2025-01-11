// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["isDebug", false]) exitWith {false};

params ["_groupid", "_uid", "_context"];

private _mission = missionNamespace getVariable "MissionID";
if (isNil {_mission}) exitWith {
	[format["%1 | ERROR: MissionID is nil!", __FILE_NAME__], "Warning"] call Shadec_fnc_createLogServer;
	false
};

if (isNil {_uid}) then {
    "Extdb3" callExtension format ["0:%1:endCommanding:%2:%3:%4", PROTOCOL, _mission, _groupid, _context];
} else {
    "Extdb3" callExtension format ["0:%1:endCommandingUid:%2:%3:%4", PROTOCOL, _mission, _uid, _context];
};

true