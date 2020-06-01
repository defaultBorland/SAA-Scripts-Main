params ["_unit","_uid","_data"];
_unit = _this # 0;
_uid = getPlayerUID _unit;
_data = [_uid,_unit];

if (_unit getVariable ["SAA_isZeus", false]) exitWith {
	[] call Shadec_fnc_addZeusModules;
    [[player, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
    _unit addAction [ localize "str_SAA_ASSIGN_ZEUS_ACTION", {
        [[player, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
    }];
};

[["loadAll", _data],Shadec_fnc_call_db] remoteExec ["spawn", 2];

// _unit in (allCurators apply {getAssignedCuratorUnit _x})