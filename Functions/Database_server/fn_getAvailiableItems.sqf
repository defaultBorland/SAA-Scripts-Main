// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_pClass", "_sClass"];

private _return = "Extdb3" callExtension format ["0:%1:getAvailableItems:%2:%3", PROTOCOL, _pclass, _sclass]; 
if (true) exitWith { [_return] call Shadec_db_server_fnc_processExtensionReturn };