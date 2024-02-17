[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FUEL_CARGO_REARM", localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SIZE_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

    if (_objectUnderCursor isKindOf "Man") exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_MUST_NOT_BE_A_MAN"] call bis_fnc_showCuratorFeedbackMessage;
	};

	private _currentSize = _objectUnderCursor getVariable ["ace_cargo_size", [typeOf _objectUnderCursor] call ace_cargo_fnc_getSizeItem];

	[localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SIZE_DIALOG_HEADER",
		[
			["SLIDER", [localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SIZE_DIALOG_SIZE_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SIZE_DIALOG_SIZE_TOOLTIP"],
				[
					-1, 100, _currentSize, 0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_currentSize"];
			_args params ["_objectUnderCursor"];

			[_objectUnderCursor, round _currentSize] call ace_cargo_fnc_setSize;
            [localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_CARGO_SET_CARGO_SIZE_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;