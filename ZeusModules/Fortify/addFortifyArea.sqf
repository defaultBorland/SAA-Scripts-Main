// 
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FORTIFY", localize "STR_SAA_ZEUS_MODULES_FORTIFY_ADD_FORTIFY_AREA_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _name = format ["FortifyArea_%1", count (missionNamespace getVariable ["ace_fortify_locations", []])];

	[localize "STR_SAA_ZEUS_MODULES_FORTIFY_ADD_FORTIFY_AREA_DIALOG_HEADER",
		[
			["EDIT", [localize "STR_SAA_ZEUS_MODULES_FORTIFY_ADD_FORTIFY_AREA_DIALOG_NAME_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FORTIFY_ADD_FORTIFY_AREA_DIALOG_NAME_TOOLTIP"],
				[
					_name,
					{

					}
				]
			],
			["SLIDER:RADIUS", [localize "STR_SAA_ZEUS_MODULES_FORTIFY_ADD_FORTIFY_AREA_DIALOG_RADIUS_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FORTIFY_ADD_FORTIFY_AREA_DIALOG_RADIUS_TOOLTIP"],
				[
					10, 2000, 50, 0, [ASLToAGL getPosASL _objectUnderCursor, ASLToAGL _position] select (_objectUnderCursor isEqualTo objNull), [1,0.373,0.122,1]
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_name", "_radius"];
			_args params ["_position", "_objectUnderCursor"];
		
			private _fortifyLocationsInfo = missionNamespace getVariable ["SAA_fortify_locations", []];
			if (_name in (_fortifyLocationsInfo apply {_x # 0})) exitWith {
				[objNull, localize "STR_SAA_ZEUS_MODULES_FORTIFY_ADD_FORTIFY_AREA_MESSAGES_NAME_ALREADY_EXIST"] call bis_fnc_showCuratorFeedbackMessage;
			};

			if !(isNull _objectUnderCursor) then {_position = _objectUnderCursor};

			[[_name, _position, _radius], Shadec_fnc_addFortifyArea] remoteExec ["call", 2];
			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_FORTIFY_ADD_FORTIFY_AREA_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_position, _objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;