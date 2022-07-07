_zeusSAAContextActionOff = [
	"SAA_Context_Off", 
	localize "STR_SAA_ZEUS_CONTEXT_ACTIONS_HIDE_ACTIONS_ACTIONNAME", 
	"\a3\ui_f\data\IGUI\Cfg\Actions\ico_OFF_ca.paa",
	{	// Statement
		player setVariable ["SAA_Context_Toggled", false];
	},	
	{	// Condition
		player getVariable ["SAA_Context_Toggled", false]
	}	
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _zeusSAAContextActionOff] call ace_interact_menu_fnc_addActionToZeus;