//
if !((getPlayerUID player) in ["76561198066438612", "76561198036166294", "76561198042919168"]) exitWith {};

_action = ["modsApprovalMenu", "Mods Approval", "\A3\UI_F\data\GUI\Rsc\RscDisplayMain\infoMods_ca.paa", // "\A3\Modules_F_Curator\Data\portraitDiary_ca.paa"
	{
		createDialog "ModsApprovalDisplay";
	},	// Statement
	{
		(getPlayerUID player) in ["76561198066438612", "76561198036166294", "76561198042919168"]
	},	// Condition
	{},
	[]
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root"], _action] call ace_interact_menu_fnc_addActionToObject;