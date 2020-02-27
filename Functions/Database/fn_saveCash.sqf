params ["_uid"];
_uid = _this # 0;

_cash = missionNamespace getVariable (format ["pCash_%1", _uid]);
if (isNil {_cash}) exitWith {};

[["saveStorage", [_cash, _uid]], Shadec_fnc_call_db] remoteExec ["spawn", 2];