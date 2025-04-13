// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

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

true