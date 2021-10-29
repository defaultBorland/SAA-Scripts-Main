//
_action = ["playersList", localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_MODULENAME", "img\playersList.paa",
{[["All", "Groups", side player, true], Shadec_fnc_playersList] remoteExec ["call", 2]},	// Statement
{(player getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT","SPC","PV2"]}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root", "SAA_rootTeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;