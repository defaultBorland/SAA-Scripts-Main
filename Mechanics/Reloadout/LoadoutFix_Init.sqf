//
_action = ["fixLocalLoadout", localize "STR_SAA_FIX_LOADOUT_ACTION", "",
	{
		call Shadec_fnc_savePlayerRadioSettings;

		[[getUnitLoadout player, player], {(_this # 1) setUnitLoadout (_this # 0)}] remoteExec ["call",2];

		cutText [localize "STR_SAA_MESSAGE_LOADOUT_WAS_FIXED", "PLAIN", 1];

		[{
			call Shadec_fnc_loadPlayerRadioSettings;
		}, [], 1] call CBA_fnc_waitAndExecute;
		
	},	// Statement
	{true}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root"], _action] call ace_interact_menu_fnc_addActionToObject;