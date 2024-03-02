_zeusLockServer = [
	"SAA_LockServer", 
	localize "STR_SAA_ZEUS_LOCK_SERVER_ACTIONNAME", 
	"\a3\ui_f\data\GUI\Rsc\RscDisplayDynamicGroups\Lock.paa",
	{	// Statement
        {
            private _status = "f5znFms2" serverCommand "#lock";
            if (_status) then {
                missionNamespace setVariable ["SAA_isServerLocked", true, true];

                [format ["> Server: %1.", localize "STR_SAA_MESSAGE_SERVER_LOCKED"]] remoteExec ["systemChat", -2];
                [format["%1 locked server", name ([remoteExecutedOwner] call Shadec_fnc_getPlayer)], "Info"] call Shadec_fnc_createLogServer;
                {[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_MESSAGE_SERVER_LOCKED", 3] call BIS_fnc_curatorHint} remoteExec ["call", remoteExecutedOwner];
            } else {
                {[localize "STR_SAA_GENERAL_FAILURE", localize "STR_SAA_GENERAL_ERROR", 3] call BIS_fnc_curatorHint} remoteExec ["call", remoteExecutedOwner];
            };
        } remoteExec ["call", 2];
	},	
	{	// Condition
		!(missionNamespace getVariable ["SAA_isServerLocked", false])
	}	
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _zeusLockServer] call ace_interact_menu_fnc_addActionToZeus;