// MAKE SQUAD LIST
_action = ["playersList", localize "STR_SAA_SQUADLIST_ACTION_NAME", "img\playersList.paa",
	{[["All", "Squad", side player, true, player], Shadec_fnc_playersList] remoteExec ["call", 2]},	// Statement
	{(count units group player) > 1}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root", "SAA_rootTeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;