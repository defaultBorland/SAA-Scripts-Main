// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_extensionReturn", ["_singleResult", false]];

_extensionReturn = parseSimpleArray _extensionReturn;

_extensionReturn params ["_msgType", "_return"];

// diag_log format["fnc_processExtensionReturn | _msgType: %1, _return: %2", _msgType, _return];

if (_msgType isEqualTo 1) exitWith { [_return, _return # 0] select _singleResult};
if (_msgType isEqualTo 2) exitWith { [_return] call Shadec_db_server_fnc_processMultipartMsg };