[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FUEL_CARGO_REARM", localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SPACE_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if (_objectUnderCursor isKindOf "Man") exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_MUST_NOT_BE_A_MAN"] call bis_fnc_showCuratorFeedbackMessage;
	};

	private _currentCargo = [(_objectUnderCursor getVariable ["ace_cargo_loaded", 0]) apply {_x call ace_cargo_fnc_getSizeItem}] call Shadec_fnc_sumArray;
	private _currentSpace = (_objectUnderCursor getVariable ["ace_cargo_space", 0]);;

	[localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SPACE_DIALOG_HEADER",
		[
			["SLIDER", [localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SPACE_DIALOG_SPACE_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SPACE_DIALOG_SPACE_TOOLTIP"],
				[
					-1, 100, _currentSpace + _currentCargo, 0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_newCargoSpace"];
			_args params ["_objectUnderCursor"];

			[_objectUnderCursor, round _newCargoSpace] call ace_cargo_fnc_setSpace;
			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SPACE_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;