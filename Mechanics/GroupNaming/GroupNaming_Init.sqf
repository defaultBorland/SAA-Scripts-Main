//
_action = ["renameGroup", localize "SAA_GROUPNAMING_ACTION_NAME", "img\SAA_logo_256.paa",
{[] call Shadec_fnc_renameGroupDisplay},	// Statement
{player isEqualTo (leader group player)}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_TeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;