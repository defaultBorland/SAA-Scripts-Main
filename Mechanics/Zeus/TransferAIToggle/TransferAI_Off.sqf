_zeusTransferAIOff = [
	"SAA_TransferAI_Disable", 
	localize "STR_SAA_ZEUS_TRANSFER_AI_DISABLE_ACTIONNAME", 
	"\a3\ui_f\data\IGUI\Cfg\Actions\ico_OFF_ca.paa",
	{	// Statement
		player setVariable ["SAA_TransferAI_Toggled", false];
	},	
	{	// Condition
		player getVariable ["SAA_TransferAI_Toggled", false]
	}	
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _zeusTransferAIOff] call ace_interact_menu_fnc_addActionToZeus;