//
_action = ["playersList", localize "SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_MODULENAME", "img\SAA_logo_256.paa",
{[["All", "Groups", true], Shadec_fnc_playersList] remoteExec ["call", 2]},	// Statement
{(player isEqualTo (leader group player)) and {(player getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT","SPC"]}}	// Condition |  and {missionNamespace getVariable ["playersListDeclared", false]} 
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_TeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;