params ["_unit"];

_uid = getPlayerUID _unit;
_data = [_uid, _unit];

if (_unit getVariable ["SAA_isZeus", false]) exitWith {
    [[player, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
};

[["loadAll", _data], Shadec_fnc_call_db] remoteExec ["spawn", 2];