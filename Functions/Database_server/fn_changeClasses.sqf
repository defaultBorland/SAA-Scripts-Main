// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["isDebug", false]) exitWith {false};

params ["_uid", "_pclass", "_sClass"];

"Extdb3" callExtension format ["0:%1:changeClasses:%2:%3:%4", PROTOCOL,
    _pclass,
    _sClass,
    _uid
];

true