params ["_unit"];

[[_unit], {
	params ["_unit"];

	private _mission = missionNamespace getVariable "MissionID";
	if (isNil {_mission}) exitWith {
		["fnc_getRespawnTime | ERROR: MissionID is nil!" ,"Warning"] call Shadec_fnc_createLogServer;
	};

	private _uid = getPlayerUID _unit;
	private _data = [_uid, _unit, _mission];

	["getRespawnTime", _data] call Shadec_fnc_call_db;
}] remoteExec ["call", 2];
