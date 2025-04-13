// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

private _return = "Extdb3" callExtension format ["0:%1:getDefaultLoadouts", PROTOCOL];
private _data = _return call Shadec_db_server_fnc_processExtensionReturn;

//return (each array is enclosed in additional array because of rows)
_data apply {_x # 0}