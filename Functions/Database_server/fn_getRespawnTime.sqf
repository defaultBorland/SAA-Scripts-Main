// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_unit"];

// [[_unit], {
// 	params ["_unit"];

// 	private _mission = missionNamespace getVariable "MissionID";
// 	if (isNil {_mission}) exitWith {
// 		["fnc_getRespawnTime | ERROR: MissionID is nil!" ,"Warning"] call Shadec_fnc_createLogServer;
// 	};

// 	private _uid = getPlayerUID _unit;
// 	private _data = [_uid, _unit, _mission];

// 	["getRespawnTime", _data] call Shadec_fnc_call_db;
// }] remoteExec ["call", 2];


// 	_info params ["_uid", "_unit", "_mission"];
// 	[format["_info: %1", _info], "Debug"] call Shadec_fnc_createLogServer;
// 	_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getDeadTime:%2:%3", PROTOCOL, _uid, _mission])) # 1) # 0;
// 	[format["_getData: %1", _getData], "Debug"] call Shadec_fnc_createLogServer;
// 	if !(isNil {_getData}) then {
// 		_getData params ["_deadTime"];

// 		[format["Player %1 dead time: %2", _uid, _deadTime], "Debug"] call Shadec_fnc_createLogServer;
// 		if (isNil {_deadTime}) exitWith {};

// 		// Problem: need to considerate wave respawnTemplate (x2 time to respawn)
// 		private _timeToRespawn = (respawnTime - _deadTime) max 10;

// 		[format["Player %1 time to respawn: %2", _uid, _timeToRespawn], "Debug"] call Shadec_fnc_createLogServer;

// 		// [_timeToRespawn] remoteExec ["setPlayerRespawnTime", _unit];
// 	};