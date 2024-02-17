// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_saveModlist | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

params ["_unit", "_modlist"];

private _processedMods = [_unit, _modlist] call Shadec_fnc_processModlist;
_processedMods params ["_clientMods", "_suspiciousMods", "_restrictedMods"];

private _count = count _clientMods; // _modlist

"Extdb3" callExtension format ["1:%1:saveModlist:%2:%3:%4:%5:%6:%7", PROTOCOL,
    getPlayerUID _unit,
    name _unit,
    _count,
    _clientMods, // _modlist
    _suspiciousMods,
    _restrictedMods
];