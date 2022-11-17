// 
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FORTIFY", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_TOGGLE_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if !(missionNamespace getVariable ["SAA_fortify_isSettingsSet", false]) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_MESSAGES_FORTIFY_NOT_SET"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_TOGGLE_DIALOG_HEADER",
		[
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_TOGGLE_DIALOG_PRESETS_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_TOGGLE_DIALOG_PRESETS_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_enable"];

			missionNamespace setVariable ["ace_fortify_fortifyAllowed", _enable, true];
			
			[localize "STR_SAA_GENERAL_SUCCESS", [localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_TOGGLE_ZEUSMESSAGE_OFF", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_TOGGLE_ZEUSMESSAGE_ON"] select _enable, 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;