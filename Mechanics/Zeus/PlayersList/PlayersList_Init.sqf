//
_zeusSAAPlayersListAction = ["SAA_Zeus_PL", localize "STR_SAA_PLAYERSLIST_ACTION_NAME", "img\Actions\playersList.paa",
	{},	// Statement
	{true},	// Condition
	{	
		 params ["_target", "_player", "_params"];

		private _actions = [];
		{
			private _action = [
				"SAA_Zeus_PL_" + toUpper _x,
				localize ("STR_SAA_GENERAL_" + toUpper _x),
				"",
				{
					params ["_target", "_player", "_actionParams"];
					_actionParams params ["_status"];
					
					[[_status, sideUnknown], Shadec_fnc_playersList] remoteExec ["call", 2]
				}, {true}, {}, [_x]
			] call ace_interact_menu_fnc_createAction;
			_actions pushBack [_action, [], _target];
		} forEach ["All", "Alive", "Dead"];

		_actions
	} // Children
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _zeusSAAPlayersListAction] call ace_interact_menu_fnc_addActionToZeus;