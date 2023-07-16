player setVariable ["SAA_TransferAI_Toggled", true];

_zeusTransferAIOn = [
	"SAA_TransferAI_Enable", 
	localize "STR_SAA_ZEUS_TRANSFER_AI_ENABLE_ACTIONNAME", 
	"\a3\ui_f\data\IGUI\Cfg\Actions\ico_ON_ca.paa",
	{	// Statement
		player setVariable ["SAA_TransferAI_Toggled", true];
	},	
	{	// Condition
		!(player getVariable ["SAA_TransferAI_Toggled", false])
	}	
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _zeusTransferAIOn] call ace_interact_menu_fnc_addActionToZeus;