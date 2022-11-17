private _turnTurret = [
    "TurnTurret",
    localize "STR_SAA_ZEUS_CONTEXT_ACTIONS_WATCH_DO_WATCH_ACTIONNAME",
    "\x\zen\addons\modules\ui\target_ca.paa",
    { // Statement
		params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
		[
			_hoveredEntity,
			{
				params ["_successful", "_object", "_positionASL", "_args", "_shift", "_ctrl", "_alt"];
				private _gunner = gunner _object;
				private _position = ASLToAGL _positionASL;

				[[_gunner, _position], {
					params ["_gunner", "_position"];
					_gunner doWatch _position;
					_gunner setVariable ["SAA_doWatching", true, true];
				}] remoteExec ["call", owner _gunner];
			},
			[], 
			"STR_SAA_ZEUS_CONTEXT_ACTIONS_WATCH_DO_WATCH_ACTIONNAME",
			"\a3\ui_f\data\igui\cfg\cursors\select_target_ca.paa",
			45,
			[1, 0, 0, 1]
		] call zen_common_fnc_selectPosition;
	}, 
    { // Condition
        params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
		(player getVariable ["SAA_Context_Toggled", false])
		&& {_hoveredEntity isNotEqualTo objNull}
		&& {gunner _hoveredEntity isNotEqualTo objNull}
		&& {!isPlayer gunner _hoveredEntity}
		&& {alive gunner _hoveredEntity}
		&& {(lifeState gunner _hoveredEntity) in ["HEALTHY", "INJURED"]}
    }
] call zen_context_menu_fnc_createAction;
private _actionPath = [_turnTurret, [], 0] call zen_context_menu_fnc_addAction;