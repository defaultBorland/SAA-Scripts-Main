//
params [""];

{
	systemTime params ["_year", "_month", "_day", "_hours", "_minutes"];

	private _missionID = format["%1-%2-%3-%4", 
		_year, 
		[str _month, 2, "0"] call Shadec_fnc_leftPad, 
		[str _day, 2, "0"] call Shadec_fnc_leftPad, 
		([str _hours, 2, "0"] call Shadec_fnc_leftPad) + ([str _minutes, 2, "0"] call Shadec_fnc_leftPad)];
	missionNamespace setVariable ["MissionID", _missionID];

	private _map = toUpper getText(configFile >> "CfgWorlds" >> worldName >> "description");

	private _data = [_missionID, _map];
	["createMission", _data] call Shadec_fnc_call_db;
} remoteExec ["call", 2];
