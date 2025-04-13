// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

params ["_type", "_function", "_status", "_message", "_time", "_additional_info"];

private _mission = missionNamespace getVariable "MissionID";
if (isNil {_mission}) exitWith {
	[format["%1 | ERROR: MissionID is nil!", __FILE_NAME__], "Warning"] call Shadec_fnc_createLogServer;
	false
};

"Extdb3" callExtension format ["1:%1:savePythiaLog:%2:%3:%4:%5:%6:%7:%8", PROTOCOL, _type, _function, _status, _additional_info, _message splitString ":" joinString "", _time, _mission];