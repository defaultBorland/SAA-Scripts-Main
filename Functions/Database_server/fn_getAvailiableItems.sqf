// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_getAvailiableItems | Server only function"};

params ["_pClass", "_sClass"];

private _sql = format["SELECT classname FROM items_restrictions WHERE %1_P = 1", _pClass];
if (_sClass isNotEqualTo "None") then {_sql = format["%1 OR %2_S = 1", _sql, _sClass]};

private _return = "Extdb3" callExtension format ["0:SQL:%1", _sql];

if (true) exitWith { [_return] call Shadec_db_server_fnc_processExtensionReturn };