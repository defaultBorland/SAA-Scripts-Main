// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["isDebug", false]) exitWith {false};

params ["_uid", "_storageContent"];

if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {false}; // Player is Zeus
if !(missionNamespace getVariable (format["loadoutLoaded_%1", _uid])) exitWith {false}; // Loadout not properly loaded in case of crash or something
if (missionNamespace getVariable [format["SAA_isGuest_%1", _uid], false]) exitWith {false}; // Player is Guest with static loadout
		
"Extdb3" callExtension format ["1:%1:saveStorageSpecial:%2:%3", PROTOCOL,
    _storageContent,
    _uid
];

true