//
_action = ["showTicketsLeft", localize "SAA_SHOWTICKETS_ACTIONNAME", "img\SAA_logo_256.paa",
	{[[player], Shadec_fnc_showTickets] remoteExec ["call", 2]},	// Statement
	{true}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_TeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;