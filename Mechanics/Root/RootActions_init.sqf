//
_action = ["SAA_root", "SAA", "img\SAA_logo_256.paa",
	{},	// Statement
	{true}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//
_action = ["SAA_rootTeamManagement", localize "STR_SAA_TEAM_MANAGEMENT_ACTION", "img\team_management_ca.paa",
	{},	// Statement
	{true}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root"], _action] call ace_interact_menu_fnc_addActionToObject;