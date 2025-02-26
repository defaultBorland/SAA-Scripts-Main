_zeusShowServerFpsOff = [
	"SAA_ShowServerFps_Disable", 
	localize "STR_SAA_ZEUS_SHOW_SERVER_FPS_DISABLE_ACTIONNAME", 
	"\a3\ui_f\data\IGUI\Cfg\Actions\ico_OFF_ca.paa",
	{	// Statement
		player setVariable ["SAA_ShowServerFps_Toggled", false];
		
		if (!isNull (findDisplay 312)) then {
			_curatorDisplay = findDisplay 312;

			private _controlGroup = _curatorDisplay displayCtrl 54473860;
        	if (!isNull _controlGroup) then {ctrlDelete _controlGroup};

			private _screenshotMode_EH_ID = _curatorDisplay getVariable ["SAA_screenshotMode_EH_ID", 0];
			_curatorDisplay displayRemoveEventHandler ["KeyDown", _screenshotMode_EH_ID];
			_curatorDisplay setVariable ["SAA_screenshotMode_EH_ID", 0];
		};

		private _EH_ServerFpsMonitoring_ID = player getVariable ["SAA_ServerFpsMonitoring_EH_ID", 0];
		["SAA_ServerFpsMonitoring", _EH_ServerFpsMonitoring_ID] call CBA_fnc_removeEventHandler;
	},	
	{	// Condition
		player getVariable ["SAA_ShowServerFps_Toggled", false]
	}	
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _zeusShowServerFpsOff] call ace_interact_menu_fnc_addActionToZeus;