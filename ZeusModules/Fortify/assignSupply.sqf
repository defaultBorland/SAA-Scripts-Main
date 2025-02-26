// 
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FORTIFY", localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if (_objectUnderCursor isKindOf "Man") exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_MUST_NOT_BE_A_MAN"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if (_objectUnderCursor getVariable ["SAA_fortify_suply", false]) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_MESSAGES_ALREADYSUPPLY"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if !(missionNamespace getVariable ["SAA_fortify_isSettingsSet", false]) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_MESSAGES_FORTIFY_NOT_SET"] call bis_fnc_showCuratorFeedbackMessage;
	};

	private _hasInventory = [_objectUnderCursor] call Shadec_fnc_objectHasInventory;
	private _playersCount = count ([] call Shadec_fnc_getPlayers);

	private _dialog = [
		["SIDES", [localize "STR_SAA_GENERAL_SIDE", localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_DIALOG_SIDE_TOOLTIP"],
			west
		],
		["SLIDER", [localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_DIALOG_BUDGET_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_DIALOG_BUDGET_TOOLTIP"],
			[
				5, 1000, 0, {
					str (ceil (_this / 5) * 5)
				}
			]
		]
	];
	if (_hasInventory) then {
		_dialog pushBack ["SLIDER", [localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_DIALOG_PRESETS_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_DIALOG_PRESETS_TOOLTIP"],
			[
				0, _playersCount, 0, 0
			]
		]
	};

	[localize "STR_SAA_ZEUS_MODULES_FORTIFY_ASSIGN_FORTIFY_SUPPLY_DIALOG_HEADER",
		_dialog,
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_side", "_budget", ["_toolsToAdd", 0]];
			_args params ["_objectUnderCursor"];
			
			[[_objectUnderCursor, _side, ceil(_budget / 5) * 5, _toolsToAdd], Shadec_fnc_assignFortifySupply] remoteExec ["call", 2];
			
			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SUPPLY_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;
