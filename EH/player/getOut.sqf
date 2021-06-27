// Empty Loadout Bug Workaround

player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	[[name _unit, getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName")], {systemChat format["%1 getting out of %2.", _this # 0, _this # 1]}] remoteExec ["call", -2];
	[{player isEqualTo vehicle player}, // Condition
		{
			params ["_unit", "_vehicle"];
			[[_unit, getUnitLoadout _unit, _vehicle], {
				params ["_unit", "_localLoadout", "_vehicle"];
				if !((getUnitLoadout player) isEqualTo _localLoadout) then {
					// _unit setUnitLoadout _localLoadout;
					[[name _unit, getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName")], {systemChat format["%1 getting out of %2 with unmet loadouts on client/server.", _this # 0, _this # 1]}] remoteExec ["call", -2];
				};
			}] remoteExec ["call", 2];
		}, // Statement
		[_unit, _vehicle], // Args
		10, {}
	] call CBA_fnc_waitUntilAndExecute;
}];