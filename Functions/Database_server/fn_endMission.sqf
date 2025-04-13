// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

private _missionID = missionNamespace getVariable "MissionID";
if (isNil {_missionID}) exitWith {};

"Extdb3" callExtension format ["0:%1:endMission:%2", PROTOCOL, _missionID];

if (
	(missionNamespace getVariable ["SAA_isMissionSpecial", false])
	&& {missionNamespace getVariable ["SAA_missionSpecial_clearTable", false]}
) then {
	"Extdb3" callExtension format ["0:%1:clearPlayersSpecial", PROTOCOL];
};

true