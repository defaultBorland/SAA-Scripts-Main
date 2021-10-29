//
_action = ["showTicketsLeft", localize "STR_SAA_SHOWTICKETS_ACTIONNAME", "img\checkTickets.paa",
	{[[player, side player], Shadec_fnc_showTickets] remoteExec ["call", 2]},	// Statement
	{true}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root"], _action] call ace_interact_menu_fnc_addActionToObject;