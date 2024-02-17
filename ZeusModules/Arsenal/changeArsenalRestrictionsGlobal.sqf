//
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_ARSENAL", localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_RESTRICTIONS_GLOBAL_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	[localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_RESTRICTIONS_GLOBAL_MODULENAME", 
		[
				["CHECKBOX", 
					[localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_RESTRICTIONS_GLOBAL_DIALOG", localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_RESTRICTIONS_TOOLTIP"], 
					!(missionNamespace getVariable ["SAA_isArsenalUnrestricted", false]), 
					true
				]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_state"];

			missionNamespace setVariable ["SAA_isArsenalUnrestricted", !_state, true];

			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_RESTRICTIONS_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;

			[["Arsenal Restrinctions lifted globally!", "Arsenal Restrinctions set globally!"] select _state, "Warning"] call Shadec_fnc_createLogServer;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;