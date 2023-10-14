//
params [""];

{
	private _missionID = missionNamespace getVariable "MissionID";
	if (isNil {_missionID}) exitWith {};

	private _commanders = ([] call Shadec_fnc_getPlayers) select {
		(leader group _x) isEqualTo _x
		&& {({isPlayer _x} count units group _x) > 3}
	} apply {getPlayerUID _x};

	private _zeuses = (missionNamespace getVariable ["ZeusArray", []]) - [""];

	private _data = [_missionID, _zeuses, _commanders];

	["endMission", _data] call Shadec_fnc_call_db;
	
} remoteExec ["call", 2];
