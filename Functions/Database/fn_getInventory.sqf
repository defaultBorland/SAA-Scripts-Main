params ["_unit"];

private _uid = getPlayerUID _unit;
private _data = [_uid, _unit];

[["loadInventory", _data], Shadec_fnc_call_db] remoteExec ["spawn", 2];