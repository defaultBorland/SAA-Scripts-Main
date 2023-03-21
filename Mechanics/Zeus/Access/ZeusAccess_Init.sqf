//
_action = ["SAA_rootZeusAccess", localize "STR_SAA_GENERAL_ZEUS", "a3\ui_f_curator\Data\Logos\arma3_zeus_icon_ca.paa",
	{ // Statement

	},
	{	// Condition
		_player getVariable ["SAA_isZeus", false]
	}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root"], _action] call ace_interact_menu_fnc_addActionToObject;

//
private _assignAction = ["assignZeus", localize "STR_SAA_ASSIGN_ZEUS_ACTION", "",
	{	// Statement
		params ["_target", "_player", "_actionParams"];
		[[_player, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
	},	
	{	// Condition
		params ["_target", "_player", "_actionParams"];

		(_player getVariable ["SAA_isZeus", false]) &&
		{isNull (getAssignedCuratorLogic _player)}
	}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root", "SAA_rootZeusAccess"], _assignAction] call ace_interact_menu_fnc_addActionToObject;

//
private _unassignAction = ["resignZeus", localize "STR_SAA_UNASSIGN_ZEUS_ACTION", "",
	{	// Statement
		params ["_target", "_player", "_actionParams"];
		[[_player, "unassign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
	},	
	{	// Condition
		params ["_target", "_player", "_actionParams"];

		(_player getVariable ["SAA_isZeus", false]) &&
		{!isNull (getAssignedCuratorLogic _player)}
	}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root", "SAA_rootZeusAccess"], _unassignAction] call ace_interact_menu_fnc_addActionToObject;