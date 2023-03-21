params ["_unit"];

if (_unit getVariable ["SAA_isZeus", false]) exitWith {
    [[_unit, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
};

private _uid = getPlayerUID _unit;
private _data = [_uid, _unit];

[["loadAll", _data], Shadec_fnc_call_db] remoteExec ["spawn", 2];