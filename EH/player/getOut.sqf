// Empty Loadout Bug Workaround

private _EH_Index = player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];

	[{player isEqualTo (vehicle player)}, {
		params ["_unit", "_vehicle"];
		[[_unit, getUnitLoadout _unit, _vehicle], {
			params ["_unit", "_localLoadout", "_vehicle"];
			diag_log format ["EH_GETOUT | _localLoadout: %1, _serverLoadout: %2", _localLoadout, getUnitLoadout _unit];
			if !((getUnitLoadout _unit) isEqualTo _localLoadout) then {
				// _unit setUnitLoadout _localLoadout;
				[[name _unit, typeOf _vehicle], {systemChat format["[DEBUG] > Server: %1 getting out of '%2' with unmet loadouts on client/server.", _this # 0, _this # 1]}] remoteExec ["call", -2];
			};
		}] remoteExec ["call", 2];
	}, [_unit, _vehicle], 10, {}] call CBA_fnc_waitUntilAndExecute;
}];

player setVariable ["EH_GetOutMan", ["GetOutMan", _EH_Index]];
// player removeEventHandler (player getVariable ["EH_GetOutMan", []]);