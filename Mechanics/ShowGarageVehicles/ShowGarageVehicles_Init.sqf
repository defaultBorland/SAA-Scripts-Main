_action = ["showGarageVehicles", localize "STR_SAA_SHOW_GARAGE_VEHICLES_ACTION_NAME", "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\spaceGarage_ca.paa",
	{	// Statement
		params ["_target", "_player", "_actionParams"];
		[[], Shadec_fnc_showGarageVehicles] remoteExec ["call", 2];
	},	
	{	// Condition
		(player getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT","SPC"]
	},
	{},
	[],
	"",
	4,
	[false, false, false, true, false], 
	{}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root"], _action] call ace_interact_menu_fnc_addActionToObject;