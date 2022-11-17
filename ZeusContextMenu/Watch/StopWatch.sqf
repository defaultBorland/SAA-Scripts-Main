private _returnTurret = [
    "TurnTurret",
    "Stop Watching",
    ["\x\zen\addons\modules\ui\target_ca.paa", [0.9, 0, 0, 1]],
    { // Statement
		params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
		private _gunner = gunner _hoveredEntity;
		[[_gunner], {
			params ["_gunner"];
			_gunner doWatch objNull;
        	_gunner setVariable ["SAA_doWatching", false, true];
		}] remoteExec ["call", owner _gunner];
	}, 
    { // Condition
        params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
		(player getVariable ["SAA_Context_Toggled", false])
		&& {_hoveredEntity isNotEqualTo objNull}
		&& {gunner _hoveredEntity isNotEqualTo objNull}
		&& {!isPlayer gunner _hoveredEntity}
		&& {alive gunner _hoveredEntity}
		&& {(lifeState gunner _hoveredEntity) in ["HEALTHY", "INJURED"]}
		&& {(gunner _hoveredEntity) getVariable ["SAA_doWatching", false]}
    }
] call zen_context_menu_fnc_createAction;
private _actionPath = [_returnTurret, [], 0] call zen_context_menu_fnc_addAction;