//
_action = ["fixLocalLoadout", localize "STR_SAA_FIX_LOADOUT_ACTION", "",
	{
		if (call TFAR_fnc_haveLRRadio) then {
			player setVariable ["radioLrSettings", (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings]
		};

		[[getUnitLoadout player, player], {(_this # 1) setUnitLoadout (_this # 0)}] remoteExec ["call",2];

		[{
			if (call TFAR_fnc_haveLRRadio) then {
				[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, player getVariable "radioLrSettings"] call TFAR_fnc_setLrSettings
			};
		}, [], 1] call CBA_fnc_waitAndExecute;
		
	},	// Statement
	{true}	// Condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "SAA_root"], _action] call ace_interact_menu_fnc_addActionToObject;