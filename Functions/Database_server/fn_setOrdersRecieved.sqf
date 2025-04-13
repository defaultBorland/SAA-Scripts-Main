// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

params ["_uid"];

private _mission = missionNamespace getVariable "MissionID";
if (isNil {_mission}) exitWith {
	[format["%1 | ERROR: MissionID is nil!", __FILE_NAME__], "Warning"] call Shadec_fnc_createLogServer;
	false
};

"Extdb3" callExtension format ["1:%1:setOrdersRecieved:%2:%3", PROTOCOL, _mission, _uid];

true