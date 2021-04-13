// Empty Loadout Bug Workaround

player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	// "debug_console" callExtension ("GetOut EH Fired on player " + name player + "#1001");
			
	[
		[_unit, getUnitLoadout _unit],
		{
			params ["_unit", "_localLoadout"];
			if !((getUnitLoadout player) isEqualTo _localLoadout) then {
				_unit setUnitLoadout _localLoadout;
				"debug_console" callExtension ("GetOut EH with unmet condition Fired on player " + name player + "#1001");
			};
		}
	] remoteExec ["call", 2];
}];