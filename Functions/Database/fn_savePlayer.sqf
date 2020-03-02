params ["_unit", "_uid", "_name"];
_unit = _this # 0;
_uid = _this # 1;
_name = _this # 2;

if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {diag_log "Zeus"};
if !(missionNamespace getVariable (format["loadoutLoaded_%1", _uid])) exitWith {diag_log "loadoutLoaded is false"};
if (((missionNamespace getVariable (format["%1_DATA", _uid])) # 0) isEqualTo "RD") exitWith {diag_log "RD"};

_inventory = getUnitLoadout _unit;

_data = [_name,_inventory,_uid];

[["saveAll",_data], Shadec_fnc_call_db] remoteExec ["spawn", 2];