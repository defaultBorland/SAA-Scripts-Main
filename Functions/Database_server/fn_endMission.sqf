// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_endMission | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

private _missionID = missionNamespace getVariable "MissionID";
if (isNil {_missionID}) exitWith {};

private _commanders = ([] call Shadec_fnc_getPlayers) select {
	(leader group _x) isEqualTo _x
	&& {({isPlayer _x} count units group _x) > 3}
} apply {getPlayerUID _x};

private _zeuses = (missionNamespace getVariable ["ZeusArray", []]) - [""];

"Extdb3" callExtension format ["0:%1:endMission:%2:%3:%4", PROTOCOL, _zeuses, _commanders, _missionID];