// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_saveInventory | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_uid", "_inventory"];

"Extdb3" callExtension format ["1:%1:saveInventory:%2:%3", PROTOCOL,
    _inventory,
    _uid
];