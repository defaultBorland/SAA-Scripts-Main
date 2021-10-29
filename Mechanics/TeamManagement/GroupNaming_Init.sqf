//
_action = ["renameGroup", localize "STR_SAA_GROUPNAMING_ACTION_NAME", "img\renameSquad.paa",
	{[] call Shadec_fnc_renameGroupDisplay},	// Statement
	{player isEqualTo (leader group player)}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root", "SAA_rootTeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;