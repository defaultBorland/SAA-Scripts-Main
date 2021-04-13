// MAKE SQUAD LIST
_action = ["playersList", localize "SAA_SQUADLIST_ACTION_NAME", "img\SAA_logo_256.paa",
{[["All", "Squad", true, player], Shadec_fnc_playersList] remoteExec ["call", 2]},	// Statement
{(count units group player) > 1}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_TeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;