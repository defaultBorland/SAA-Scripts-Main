// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_loadPlayer | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_uid", "_pclass", "_sClass"];

"Extdb3" callExtension format ["0:%1:changeClasses:%2:%3:%4", PROTOCOL,
    _pclass,
    _sClass,
    _uid
];