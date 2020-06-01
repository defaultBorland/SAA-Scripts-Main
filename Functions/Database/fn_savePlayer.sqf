params ["_unit", "_uid", "_name"];
_unit = _this # 0;
_uid = _this # 1;
_name = _this # 2;

if (_unit getVariable ["SAA_isZeus", false]) exitWith {diag_log "This is Zeus, abort saving."};
if !(missionNamespace getVariable (format["loadoutLoaded_%1", _uid])) exitWith {diag_log "loadoutLoaded is false, abort saving."};
if (((missionNamespace getVariable (format["%1_DATA", _uid])) # 0) isEqualTo "GUEST") exitWith {diag_log "This is GUEST, abort saving."};

_inventory = getUnitLoadout _unit;

_data = [_name,_inventory,_uid];

[["saveAll", _data], Shadec_fnc_call_db] remoteExec ["spawn", 2];