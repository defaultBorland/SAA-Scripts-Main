params ["_position", "_radius", "_fuel"];

private _fuelStations = nearestObjects [_position, ["Land_FuelStation_01_pump_F", "Land_FuelStation_02_pump_F", "Land_FuelStation_Feed_F", "Land_fs_feed_F"], _radius, true];

if (count _fuelStations < 1) exitWith {
	{
		[objNull, localize "STR_SAA_ZEUS_MODULES_FUEL_SET_STATIONS_FUEL_ZEUSMESSAGE_FAIL_NO_GAS_STATIONS"] call bis_fnc_showCuratorFeedbackMessage;
	} remoteExec ["call", remoteExecutedOwner];
};

{
	[_x, _fuel] call ace_refuel_fnc_setFuel;
} foreach _fuelStations;

{
	[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_FUEL_SET_STATIONS_FUEL_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
} remoteExec ["call", remoteExecutedOwner];