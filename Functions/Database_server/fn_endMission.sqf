// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["isDebug", false]) exitWith {false};

private _missionID = missionNamespace getVariable "MissionID";
if (isNil {_missionID}) exitWith {};

private _commanders = ([] call Shadec_fnc_getPlayers) select {
	(leader group _x) isEqualTo _x
	&& {({isPlayer _x} count units group _x) > 3}
} apply {getPlayerUID _x};

private _zeuses = (missionNamespace getVariable ["ZeusArray", []]) - [""];

"Extdb3" callExtension format ["0:%1:endMission:%2:%3:%4", PROTOCOL, _zeuses, _commanders, _missionID];

if (
	(missionNamespace getVariable ["SAA_isMissionSpecial", false]) 
	&& {missionNamespace getVariable ["SAA_missionSpecial_clearTable", false]}
) then {
	"Extdb3" callExtension format ["0:%1:clearPlayersSpecial:%2", PROTOCOL, _missionID];
};

true