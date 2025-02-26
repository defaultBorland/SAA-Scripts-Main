// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["isDebug", false]) exitWith {false};

params ["_uid", "_inventory"];

if (missionNamespace getVariable ["SAA_isMissionSpecial", false]) exitWith {
    _this call Shadec_db_server_fnc_saveInventorySpecial;
};

"Extdb3" callExtension format ["1:%1:saveInventory:%2:%3", PROTOCOL,
    _inventory,
    _uid
];

true