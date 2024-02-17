// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_savePlayer | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_name", "_inventory", "_storage", "_uid"];

"Extdb3" callExtension format ["1:%1:savePlayer:%2:%3:%4:%5", PROTOCOL,
    str _name,
    _inventory,
    _storage,
    _uid
];