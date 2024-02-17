_zeusUnlockServer = [
	"SAA_UnlockServer", 
	localize "STR_SAA_ZEUS_UNLOCK_SERVER_ACTIONNAME", 
	"\a3\ui_f_curator\Data\CfgCurator\waypointCycle_ca.paa",
	{	// Statement
        {
            private _status = "f5znFms2" serverCommand "#unlock";
            if (_status) then {
                missionNamespace setVariable ["SAA_isServerLocked", false, true];

                [format ["> Server: %1.", localize "STR_SAA_MESSAGE_SERVER_UNLOCKED"]] remoteExec ["systemChat", -2];
                [format["%1 unlocked server", name ([str remoteExecutedOwner] call Shadec_fnc_getPlayer)], "Info"] call Shadec_fnc_createLogServer;
                {[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_MESSAGE_SERVER_UNLOCKED", 3] call BIS_fnc_curatorHint} remoteExec ["call", remoteExecutedOwner];
            } else {
                {[localize "STR_SAA_GENERAL_FAILURE", localize "STR_SAA_GENERAL_ERROR", 3] call BIS_fnc_curatorHint} remoteExec ["call", remoteExecutedOwner];
            };
        } remoteExec ["call", 2];
	},	
	{	// Condition
		missionNamespace getVariable ["SAA_isServerLocked", false]
	}	
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _zeusUnlockServer] call ace_interact_menu_fnc_addActionToZeus;