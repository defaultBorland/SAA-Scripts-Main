// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};
if (missionNamespace getVariable ["SAA_isDebug", false]) exitWith {false};

systemTime params ["_year", "_month", "_day", "_hours", "_minutes"];

private _missionID = format["%1-%2-%3-%4", 
	_year, 
	[str _month, 2, "0"] call Shadec_fnc_leftPad, 
	[str _day, 2, "0"] call Shadec_fnc_leftPad, 
	([str _hours, 2, "0"] call Shadec_fnc_leftPad) + ([str _minutes, 2, "0"] call Shadec_fnc_leftPad)];
missionNamespace setVariable ["MissionID", _missionID];

private _map = toUpper getText(configFile >> "CfgWorlds" >> worldName >> "description");
private _isSpecial = missionNamespace getVariable ["SAA_isMissionSpecial", false];

"Extdb3" callExtension format ["0:%1:createMission:%2:%3:%4", PROTOCOL, _missionID, _map, parseNumber(_isSpecial)];

true