player setVariable ["SAA_ShowServerFps_Toggled", true];
[] call Shadec_fnc_showServerFps;

_zeusShowServerFpsOn = [
	"SAA_ShowServerFps_Enable", 
	localize "STR_SAA_ZEUS_SHOW_SERVER_FPS_ENABLE_ACTIONNAME", 
	"\a3\ui_f\data\IGUI\Cfg\Actions\ico_ON_ca.paa",
	{	// Statement
		player setVariable ["SAA_ShowServerFps_Toggled", true];
		[] call Shadec_fnc_showServerFps;
	},	
	{	// Condition
		!(player getVariable ["SAA_ShowServerFps_Toggled", false])
	}	
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _zeusShowServerFpsOn] call ace_interact_menu_fnc_addActionToZeus;