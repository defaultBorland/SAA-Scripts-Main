// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

params ["_name", "_inventory", "_storage", "_uid", ["_context", "No context"]];

"Extdb3" callExtension format ["1:%1:savePlayerSpecial:%2:%3:%4:%5:%6", PROTOCOL,
    _name,
    _inventory,
    _storage,
    _uid,
    _context
];

true