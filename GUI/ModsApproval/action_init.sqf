//
if !((getPlayerUID player) in ([getText(missionConfigFile >> "adminUID")] + getArray(missionConfigFile >> "subAdminUIDs"))) exitWith {};

_action = ["modsApprovalMenu", "Mods Approval", "\A3\UI_F\data\GUI\Rsc\RscDisplayMain\infoMods_ca.paa", // "\A3\Modules_F_Curator\Data\portraitDiary_ca.paa"
	{
		createDialog "ModsApprovalDisplay";
	},	// Statement
	{
		(getPlayerUID player) in ([getText(missionConfigFile >> "adminUID")] + getArray(missionConfigFile >> "subAdminUIDs"))
	},	// Condition
	{},
	[]
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root"], _action] call ace_interact_menu_fnc_addActionToObject;