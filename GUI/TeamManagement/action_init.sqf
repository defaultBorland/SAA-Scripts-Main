//
_action = ["teamManagementMenu", localize "STR_SAA_GENERAL_MENU", "img\Actions\team_management_ca.paa",
	{
		createDialog "TeamManagementDisplay";
	},	// Statement
	{
		(player isEqualTo (leader group player)) and {(player getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT","SPC"]}
	},	// Condition
	{},
	[]
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root", "SAA_rootTeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;