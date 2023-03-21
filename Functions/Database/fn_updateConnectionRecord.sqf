params ["_uid"];

if (missionNamespace getVariable ["isDebug", false]) exitWith {};

[[_uid], {
	params ["_uid"];

	private _mission = missionNamespace getVariable "MissionID";
	if (isNil {_mission}) exitWith {
		["fnc_updateConnectionRecord | ERROR: MissionID is nil!" ,"Warning"] call Shadec_fnc_createLogServer;
	};
	
	private _data = [_uid, _mission];

	["updateConnectionRecord", _data] call Shadec_fnc_call_db;
}] remoteExec ["call", 2];
