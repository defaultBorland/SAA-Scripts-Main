// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_uid"];

private _return = "Extdb3" callExtension format ["0:%1:getRankAndClasses:%2", PROTOCOL, _uid];
if (true) exitWith { [_return, true] call Shadec_db_server_fnc_processExtensionReturn };