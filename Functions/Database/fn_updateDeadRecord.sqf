params ["_unit"];

[[_unit], {
	params ["_unit"];

	private _uid = getPlayerUID _unit;
	private _data = [_uid];

	["updateDeadRecord", _data] call Shadec_fnc_call_db;
}] remoteExec ["call", 2];

