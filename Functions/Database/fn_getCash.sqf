private["_uid","_data"];
_uid = _this # 0;

[["loadCash",_uid], Shadec_fnc_call_db] remoteExec ["spawn", 2];