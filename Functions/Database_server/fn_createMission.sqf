// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_createMission | Server only function"};
if (missionNamespace getVariable ["isDebug", false]) exitWith {};

systemTime params ["_year", "_month", "_day", "_hours", "_minutes"];

private _missionID = format["%1-%2-%3-%4", 
	_year, 
	[str _month, 2, "0"] call Shadec_fnc_leftPad, 
	[str _day, 2, "0"] call Shadec_fnc_leftPad, 
	([str _hours, 2, "0"] call Shadec_fnc_leftPad) + ([str _minutes, 2, "0"] call Shadec_fnc_leftPad)];
missionNamespace setVariable ["MissionID", _missionID];

private _map = toUpper getText(configFile >> "CfgWorlds" >> worldName >> "description");

"Extdb3" callExtension format ["0:%1:createMission:%2:%3", PROTOCOL, _missionID, _map];