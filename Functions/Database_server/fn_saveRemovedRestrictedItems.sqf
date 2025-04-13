// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

params ["_uid", "_name", "_list"];

private _missionID = missionNamespace getVariable "MissionID";
if (isNil {_missionID}) then {["fnc_removeStorageRestrictedItems | Error: MissionID IS NULL", "Warning"] call Shadec_fnc_createLogServer};

"Extdb3" callExtension format ["1:%1:saveRemovedRestrictedItems:%2:%3:%4:%5", PROTOCOL,
    _uid,
    str _name,
    _missionID,
    _list
];

true