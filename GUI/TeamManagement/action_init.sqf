//
_action = ["teamManagementMenu", localize "STR_SAA_GENERAL_MENU", "img\Actions\team_management_ca.paa",
	{
		createDialog "TeamManagementDisplay";
	},	// Statement
	{
		(player isEqualTo (leader group player)) 
		&& {
			(player getVariable ["SAA_Rank", "PV1"]) isEqualTo "SPC"
			|| (player getVariable ["SAA_isOfficer", false])
		}
	},	// Condition
	{},
	[]
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root", "SAA_rootTeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;