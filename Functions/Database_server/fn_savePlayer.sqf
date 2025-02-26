// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["isDebug", false]) exitWith {false};

params ["_name", "_inventory", "_storage", "_uid", ["_context", "No context"]];

if (missionNamespace getVariable ["SAA_isMissionSpecial", false]) exitWith {
    _this call Shadec_db_server_fnc_savePlayerSpecial;
};

"Extdb3" callExtension format ["1:%1:savePlayer:%2:%3:%4:%5:%6", PROTOCOL,
    _name,
    _inventory,
    _storage,
    _uid,
    _context
];

true