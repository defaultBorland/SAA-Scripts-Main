// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_saveStorage | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_uid", "_storageContent"];
		
"Extdb3" callExtension format ["1:%1:saveStorage:%2:%3", PROTOCOL,
    _storageContent,
    _uid
];