params["_unit"];
_unit = _this # 0;
_uid = getPlayerUID _unit;
_data = [_uid,_unit];

[["loadStorage",_data], Shadec_fnc_call_db] remoteExec ["spawn", 2];