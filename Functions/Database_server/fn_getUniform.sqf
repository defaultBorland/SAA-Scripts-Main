// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_loadPlayer | Server only function"};

params [["_camo", "None"], ["_class", "None"], ["_type", "None"]];

private _sql = format["SELECT classname FROM uniforms WHERE 1=1"];
if (_camo isNotEqualTo "None") then {_sql = format ["%1 AND camotype = '%2'", _sql, _camo]};
if (_class isNotEqualTo "None") then {_sql = format ["%1 AND class = '%2'", _sql, _class]};
if (_type isNotEqualTo "None") then {_sql = format ["%1 AND type = '%2'", _sql, _type]};

private _return = "Extdb3" callExtension format ["0:SQL:%1", _sql];
if (true) exitWith { [_return] call Shadec_db_server_fnc_processExtensionReturn };