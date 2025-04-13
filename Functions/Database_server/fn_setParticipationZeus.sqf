// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

private _mission = missionNamespace getVariable "MissionID";
private _zeuses = missionNamespace getVariable ["ZeusArray", []];

{
    "Extdb3" callExtension format ["0:%1:setParticipationZeus:%2:%3", PROTOCOL, _mission, _x];
} forEach _zeuses;

true