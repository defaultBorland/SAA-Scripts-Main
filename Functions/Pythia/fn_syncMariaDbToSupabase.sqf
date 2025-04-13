// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

private _additional_info = "MariaDB to Supabase Sync";
private _type = "sync";
private _function = "sync";

private _py_return = ["sync.sync", ["Out"]] call py3_fnc_callExtension;

_py_return params ["_status", "_msg", "_time"];

[
	format["%1 - %2 (%3 sec.)", _additional_info, _status, _time],
	["Info", "Warning"] select (_status isEqualTo "Error")
] call Shadec_fnc_createLogServer;

// Write sync result to db
[_type, _function, _status, _msg, _time, _additional_info] call Shadec_db_server_fnc_savePythiaLog;

//return
_status isEqualTo "Error"