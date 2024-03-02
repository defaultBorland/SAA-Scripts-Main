// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_eraseOrders | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_uid"];

"Extdb3" callExtension format ["1:%1:eraseOrders:%2", PROTOCOL,
    _uid
];