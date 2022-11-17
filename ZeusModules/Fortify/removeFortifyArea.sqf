// 
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FORTIFY", localize "STR_SAA_ZEUS_MODULES_FORTIFY_REMOVE_FORTIFY_AREA_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _fortifyLocationsInfo = missionNamespace getVariable ["SAA_fortify_locations", []];
	if (_fortifyLocationsInfo isEqualTo []) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_FORTIFY_REMOVE_FORTIFY_AREA_MESSAGES_NO_AREAS"] call bis_fnc_showCuratorFeedbackMessage;
	};

	_fortifyLocationsInfo = _fortifyLocationsInfo apply {_x # 0};

	[localize "STR_SAA_ZEUS_MODULES_FORTIFY_REMOVE_FORTIFY_AREA_DIALOG_HEADER",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_FORTIFY_REMOVE_FORTIFY_AREA_DIALOG_NAME_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FORTIFY_REMOVE_FORTIFY_AREA_DIALOG_NAME_TOOLTIP"],
				[
					_fortifyLocationsInfo,
					_fortifyLocationsInfo,
					0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_name"];

			[[_name], Shadec_fnc_removeFortifyArea] remoteExec ["call", 2];

			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_FORTIFY_REMOVE_FORTIFY_AREA_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;