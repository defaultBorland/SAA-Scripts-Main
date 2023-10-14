params ["_uid", "_name"];

[[_uid, _name], {
	params ["_uid", "_name"];

	private _mission = missionNamespace getVariable "MissionID";
	if (isNil {_mission}) exitWith {
		["fnc_createConnectionRecord | ERROR: MissionID is nil!" ,"Warning"] call Shadec_fnc_createLogServer;
	};

	private _data = [_uid, _name, _mission];

	["createConnectionRecord", _data] call Shadec_fnc_call_db;
}] remoteExec ["call", 2];
