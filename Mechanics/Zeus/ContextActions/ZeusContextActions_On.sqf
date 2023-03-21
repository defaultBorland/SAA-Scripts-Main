player setVariable ["SAA_Context_Toggled", false];

_zeusSAAContextActionOn = [
	"SAA_Context_On", 
	localize "STR_SAA_ZEUS_CONTEXT_ACTIONS_SHOW_ACTIONS_ACTIONNAME", 
	"\a3\ui_f\data\IGUI\Cfg\Actions\ico_ON_ca.paa",
	{	// Statement
		player setVariable ["SAA_Context_Toggled", true];
	},	
	{	// Condition
		!(player getVariable ["SAA_Context_Toggled", false])
	}	
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _zeusSAAContextActionOn] call ace_interact_menu_fnc_addActionToZeus;